import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loader.dart';

class VerifyEmailController extends GetxController{

// put will be called when we create instance for the first time
  final controller=Get.put(const VerifyEmailScreen());
  static VerifyEmailController get instance=>Get.find();

  //send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  
  void sendEmailVerification() async {
    try{
        await AuthenticationRepository.instance.sendEmailVerification();
        TLoaders.successSnackBar(title: 'Oh Snap!', message: 'Please Check your Inbox and verify your mail');
    }
    catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect(){
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async{
        await FirebaseAuth.instance.currentUser?.reload();
        final user=FirebaseAuth.instance.currentUser;

        if(user?.emailVerified??false)
        {
          timer.cancel();
          Get.off(
            ()=>SuccessScreen(image: TImages.staticSuccessIllustration, title: TTexts.yourAccountCreatedTitle, subtitle: TTexts.yourAccountCreatedSubTitle,
             onPressed: ()=>AuthenticationRepository.instance.screenRedirect())
          );
        }
      }
    );
  }

  checkEmailVerificationStatus() async{
    final currentUser=FirebaseAuth.instance.currentUser;
    if(currentUser!=null && currentUser.emailVerified)
    {
      Get.off(()=>SuccessScreen(image: TImages.staticSuccessIllustration, 
      title: TTexts.yourAccountCreatedTitle, subtitle: TTexts.yourAccountCreatedSubTitle, 
      onPressed: ()=>AuthenticationRepository.instance.screenRedirect()));
    }
  }


  //send email verification link

  //timer to redirect on email verification


  //manually check if email is verified



}