import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:improvescap/generated/assert.dart';
import 'package:improvescap/screen/home/view/home_screen.dart';
import 'package:improvescap/screen/improv_scap_prumium/controller/payment_controller.dart';
import 'package:improvescap/screen/improv_scap_prumium/view/improve_premium_screen_2.dart';
import 'package:improvescap/utils/colors.dart';

import '../../hallof_fame/view/hallof_last_screen.dart';

class ImprovScapPrumuim extends StatefulWidget {
  const ImprovScapPrumuim({Key? key}) : super(key: key);

  @override
  State<ImprovScapPrumuim> createState() => _ImprovScapPrumuimState();
}

class _ImprovScapPrumuimState extends State<ImprovScapPrumuim> {
  var paymentController = Get.put(PaymentController());
  Map<String, dynamic>? paymentIntentData;
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(() => HomeScreen());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.whitekColor,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            ImageConstant.impro,
                            height: 55,
                            width: MediaQuery.of(context).size.width - 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstant.diamondi,
                          height: 30,
                        ),
                        Image.asset(
                          "assets/setting_image/Premium.png",
                          width: 150,
                        ),
                        Image.asset(
                          ImageConstant.diamondi,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff201E23),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 28, horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ImprovScapPrumuim());
                                    },
                                    child: Text(
                                      "Premium",
                                      style: GoogleFonts.outfit(
                                          color: AppColors.cPrimaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Container(
                                      width: 2,
                                      height: 15,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: VerticalDivider(
                                        thickness: 1,
                                        color: Colors.white,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => ImprovScapPrumuim_2());
                                    },
                                    child: Text(
                                      "VIOS",
                                      style: GoogleFonts.outfit(
                                          color: AppColors.whitekColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                              buildRow(text: "No adds"),
                              buildRow(text: "Unlimed chats"),
                              buildRow(text: "No member limit"),
                              buildRow(text: "Change app icon"),
                              buildRow(text: "Premium badge next to name"),
                              buildRow(text: "Filter for premium only chats"),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 80, bottom: 120),
                                child: Center(
                                    child: Column(children: [
                                  Text(
                                    "MORE FEATURES ",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(
                                      color: AppColors.whitekColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "COMING SOON!!!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(
                                      color: AppColors.whitekColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
//                      paymentController.makePayment(amount: "50", currency: "US");

                      makePayment( "50"); // Get.to(()=>ImprovScapPrumuim_2());
                    },
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColors.cPrimaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            Text(
                              "BUY NOW",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexend(
                                color: AppColors.whitekColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "2.99 A MONTH",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexend(
                                color: AppColors.whitekColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRow({var text}) {
    return Row(
      children: [
        Image.asset(
          "assets/setting_image/right.png",
          height: 30,
        ),
        Text(
          text,
          style: GoogleFonts.abhayaLibre(
            color: AppColors.whitekColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  buildContainer({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        height: 40,
        width: double.infinity,
        color: Color(0xffD9D9D9),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: Text(
            text,
            style: GoogleFonts.outfit(
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(String ammount) async {
    try {
      paymentIntent = await createPaymentIntent(ammount, 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Adnan'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        // paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51M2TlrIyZcrUZatMeCCJJ2zu71hW6xXnmIxph9jkUMXsbaS95fU17u5yTQsbspJZFf9EFjxBR93ZxMFOyStaY2EL00THiX7PAQ',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
