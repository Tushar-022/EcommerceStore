import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_model.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class SignUpController extends GetxController {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) return '$fieldName is required';
  }

  static SignUpController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
   //   print('Starting signup process...');
      

      print(' signup process completed ...');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        print('No internet connection.');
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
  print('Form validation failed.');
  // Redirect to SignUpScreen using Get.to()

  Get.to(() => const SignUpScreen());
  return;
}

TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create an account, you must read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

    //  print('Registering user with email and password...');
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      print('Creating new user...');
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      print('Saving user record...');
      await userRepository.saveUserRecord(newUser);

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created. Verify email to continue');

      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));



      
    } catch (e) {
      print('Error occurred: $e');
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
