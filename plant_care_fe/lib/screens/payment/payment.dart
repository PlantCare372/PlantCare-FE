import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/utils/loginCredentials.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:http/http.dart' as http;

class StripePayment extends StatefulWidget {
  final int plantId;
  StripePayment({Key key, this.plantId}) : super(key: key);

  @override
  _StripePaymentState createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  final String postCreateIntentURL = "https:/yourserver/postPaymentIntent";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final StripeCard card = StripeCard();

  final Stripe stripe = Stripe(
    "pk_test_51JAcKuLeFWZmxKREhYS5IAeJIVqFu2xlWdCBHScPHj61kA8nBfqFAdyeA1LwTwUgpYor2gdTFePD4rkE2RwloiQN00iU6rp7BA", //Your Publishable Key
    stripeAccount: "acct_1JAcT2Elsb5ptiZL", //Merchant Connected Account ID. It is the same ID set on server-side.
    returnUrlForSca: "stripesdk://3ds.stripesdk.io", //Return URL for SCA
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe Payment"),
      ),
      body: new SingleChildScrollView(
        child: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Column(
              children: [
                CardForm(formKey: formKey, card: card),
                Container(
                  child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: const Text('Buy', style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        formKey.currentState.validate();
                        formKey.currentState.save();
                        buy(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buy(context) async {
    final StripeCard stripeCard = card;
    final String customerEmail = getCustomerEmail();

    if (!stripeCard.validateCVC()) {
      showAlertDialog(context, "Error", "CVC not valid.");
      return;
    }
    if (!stripeCard.validateDate()) {
      showAlertDialog(context, "Errore", "Date not valid.");
      return;
    }
    if (!stripeCard.validateNumber()) {
      showAlertDialog(context, "Error", "Number not valid.");
      return;
    }

    Map<String, dynamic> paymentIntentRes = await createPaymentIntent(stripeCard, customerEmail);
    print(paymentIntentRes);
    String clientSecret = paymentIntentRes['client_secret'];
    String paymentMethodId = paymentIntentRes['payment_method'];
    String status = paymentIntentRes['status'];

    if (status == 'requires_action') //3D secure is enable in this card
      paymentIntentRes = await confirmPayment3DSecure(clientSecret, paymentMethodId);

    if (paymentIntentRes['status'] != 'succeeded') {
      showAlertDialog(context, "Warning", "Canceled Transaction.");
      return;
    }

    if (paymentIntentRes['status'] == 'succeeded') {
      showAlertDialog(context, "Success", "Thanks for buying!");
      return;
    }
    showAlertDialog(context, "Warning", "Transaction rejected.\nSomething went wrong");
  }

  Future<Map<String, dynamic>> createPaymentIntent(StripeCard stripeCard, String customerEmail) async {
    String clientSecret;
    Map<String, dynamic> paymentIntentRes, paymentMethod;
    try {
      paymentMethod = await stripe.api.createPaymentMethodFromCard(stripeCard);
      clientSecret = await postCreatePaymentIntent(customerEmail, paymentMethod['id']);
      print(clientSecret);
      paymentIntentRes = await stripe.api.retrievePaymentIntent(clientSecret);
    } catch (e) {
      print("ERROR_CreatePaymentIntentAndSubmit: $e");
      showAlertDialog(context, "Error", "Something went wrong.");
    }
    return paymentIntentRes;
  }

  Future<String> postCreatePaymentIntent(String email, String paymentMethodId) async {
    print('gothere' + paymentMethodId);
    var clientSecret;
    http.Response response = await http.post(
      Uri.parse('http://178.128.127.43/api/v1/users/payment/buy'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${LoginCredentials.getToken()}'
      },
      body: jsonEncode(<String, dynamic>{
        "email": "tranhoaichau.00@gmail.com",
        "is_active": true,
        "is_superuser": false,
        "full_name": "string",
        "payment_method_id": paymentMethodId,
        "price": 100,
        "plant_id": widget.plantId
      }),
    );
    clientSecret = jsonDecode(response.body);
    print(clientSecret);
    return clientSecret["client_secret"]["id"];
  }

  Future<Map<String, dynamic>> confirmPayment3DSecure(String clientSecret, String paymentMethodId) async {
    Map<String, dynamic> paymentIntentRes_3dSecure;
    try {
      await stripe.confirmPayment(clientSecret, paymentMethodId: paymentMethodId);
      paymentIntentRes_3dSecure = await stripe.api.retrievePaymentIntent(clientSecret);
    } catch (e) {
      print("ERROR_ConfirmPayment3DSecure: $e");
      showAlertDialog(context, "Error", "Something went wrong.");
    }
    return paymentIntentRes_3dSecure;
  }

  String getCustomerEmail() {
    String customerEmail;
    //Define how to get this info.
    // -Ask to the customer through a textfield.
    // -Get it from firebase Account.
    customerEmail = LoginCredentials.getEmail();
    return customerEmail;
  }

  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(), // dismiss dialog
            ),
          ],
        );
      },
    );
  }
}
