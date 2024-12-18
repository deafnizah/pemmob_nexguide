import 'package:get/get.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoggedIn = false.obs;
  var userRole = ''.obs; // "mahasiswa" atau "dosbim"

  void login(String usernameInput, String passwordInput) {
    if (usernameInput.isEmpty || passwordInput.isEmpty) {
      Get.snackbar("Error", "Username dan Password tidak boleh kosong.");
      return;
    }
    if (usernameInput == 'Saraswati' && passwordInput == '1234') {
      isLoggedIn.value = true;
      userRole.value = "mahasiswa";
      Get.offNamed('/mahasiswa/home');
    } else if (usernameInput == 'Suryo Jatmiko' && passwordInput == '1234') {
      isLoggedIn.value = true;
      userRole.value = "dosbim";
      Get.offNamed('/dosbim/home');
    } else {
      Get.snackbar("Error", "Username atau Password salah.");
    }
  }
}
