import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:improvescap/screen/auth/splash_screen/splash_screen.dart';
import 'package:improvescap/screen/improv_scap_prumium/view/improvscap_prumum.dart';

import 'GetStorage/get_storage_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
WidgetsFlutterBinding.ensureInitialized();
await initServices();
  // StripePayment.setOptions(
  //     StripeOptions(
  //         publishableKey:"pk_live_51Mf88nAIDIlutdfg4ZwdnzBN31qDrkuRL34cBkNC1U4hHZNAFflWHNjx3GtFOLDtrV3zFjcjhjbbTXkbsJZy851y00lV8My5hY",
  //         merchantId: "acct_1Mf88nAIDIlutdfg",
  //         androidPayMode: 'test'
  //     ));
   Stripe.publishableKey ="pk_test_51M2TlrIyZcrUZatMJdZyAsGdcbeo7lmI7Htr5FThBQ10uJ6FK9KeJoDuDf99URfKADMDOQ4kWQIdp5CsKhDeJ2ru00gcVYwrQZ";
   Stripe.merchantIdentifier="acct_1Mf88nAIDIlutdfg";
  await Stripe.instance.applySettings();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
]);
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.put(GetSTorageController()).initstorage();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: ImprovScapPrumuim(),
    );
  }
}

