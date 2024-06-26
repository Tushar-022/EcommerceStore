
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController{

  static ForgetPasswordController get instance =>Get.find();

  final email=TextEditingController();

  GlobalKey <FormState> forgetPasswordFormKey=GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{

          TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

          final isConnected=await NetworkManager.instance.isConnected();

          if(!isConnected)
          {
            TFullScreenLoader.stopLoading();
            return;
          }

          await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

          TFullScreenLoader.stopLoading();

          TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to reset the Password');

          Get.to(()=>ResetPasswordScreen(email:email.text.trim()));
          
    }
    catch(e){
            TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }



  resendPasswordResetEmail(String email)async{

    try{
           TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

          final isConnected=await NetworkManager.instance.isConnected();

          if(!isConnected)
          {
            TFullScreenLoader.stopLoading();
            return;
          }

          await AuthenticationRepository.instance.sendPasswordResetEmail(email);

          TFullScreenLoader.stopLoading();

          TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to reset the Password');

    }
    catch(e){
           TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
} 