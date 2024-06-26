import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class LoginController extends GetxController {
  // Variables
  final RxBool rememberMe = false.obs; // Variable to store the remember me state, initialized to false
  final RxBool hidePassword = true.obs; // Reactive variable to control password visibility, initialized to true
  final localStorage = GetStorage(); // Instance of GetStorage for local storage operations
  final TextEditingController emailController = TextEditingController(); // Controller for email input field
  final TextEditingController passwordController = TextEditingController(); // Controller for password input field
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(); // Form key for login form validation
  final userController = Get.put(UserController());

  @override
  void onInit() {
    emailController.text = localStorage.read('Remember_ME_email') ?? ''; // Default to empty string if null
    passwordController.text = localStorage.read('Remember_Me_password') ?? ''; // Default to empty string if null
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    // Start Loading
    TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Form Validation
    if (!loginFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Save Data if Remember Me is selected
    if (rememberMe.value) {
      localStorage.write('Remember_ME_email', emailController.text.trim());
      localStorage.write('Remember_Me_password', passwordController.text.trim());
    }

    // Login user using Email & Password Authentication
    try {
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Remove Loader
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Handle authentication errors
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
  try {
    TFullScreenLoader.openLoadingDialog('Logging you in ...', TImages.docerAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Start Google Sign-In process
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception('Google Sign-In aborted.');
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    // Sign in with Firebase
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential);
    // Save user record
    await userController.saveUserRecord(userCredential);

    TFullScreenLoader.stopLoading();
    AuthenticationRepository.instance.screenRedirect();
  } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
  }
}

}


