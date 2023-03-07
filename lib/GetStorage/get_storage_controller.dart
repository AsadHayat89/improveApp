import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api_model/LogginModel.dart';
import '../screen/auth/login_screen/view/login_screen.dart';

class GetSTorageController extends GetxController implements GetxService {
  final box = GetStorage();

  Future<void> initstorage() async {
    await GetStorage().initStorage;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageurl.value = box.read("image").toString();
    uID.value = box.read("uid").toString();
  }

  var imageurl = "".obs;
  var uID = "".obs;
  bool isHavingData = false;

  ToggleIsHavingData(bool value) {
    isHavingData = value;
    update();
  }

  String? writeStorage(String key, String value) {
    print("saving $key and $value");
    box.write(key, value);
    ToggleIsHavingData(true);
  }
  storeLoginModel(LoginModel m) {
    box.write("login", m.toJson());
    update();
  }


  LoginModel? getloginModel() {
    final resp = box.read("login");
    update();
    print("this is val: ${resp}");
    if (resp != null) {
      return LoginModel.fromJson((resp));
    } else
      return null;
  }

  //by badar
  Future<void> removeStoragebyMe() async {
    await box.erase();
  }

  Future<void> removeStorage() async {
    log("<--------------Get Storage Remove Before-------------->");
    log(box.getKeys().toString());
    log(box.getValues().toString());
    await box.erase().then((value) async {
      ToggleIsHavingData(false);
      print("removeee storage");
      update();
      Get.offAll(() => LoginScreen());
    });
    log("<--------------Get Storage Remove After-------------->");
    log(box.getKeys().toString());
    log(box.getValues().toString());
  }
}