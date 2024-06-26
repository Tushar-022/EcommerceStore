import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:t_store/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_dotnavigation.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';



class OnBoardingScreen extends StatelessWidget {

   OnBoardingScreen({super.key});

  final controller=Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Stack(
          children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                 OnBoardingPage(
                  image:TImages.onBoardingImage1 ,
                  title:TTexts.onBoardingTitle1 ,
                  subtitle:TTexts.onBoardingSubTitle1 
                  ),
                  OnBoardingPage(
                  image:TImages.onBoardingImage2 ,
                  title:TTexts.onBoardingTitle2 ,
                  subtitle:TTexts.onBoardingSubTitle2 
                  ),
                  OnBoardingPage(
                  image:TImages.onBoardingImage3,
                  title:TTexts.onBoardingSubTitle3 ,
                  subtitle:TTexts.onBoardingSubTitle3 
                  )
                ],
              ),

              const OnBoardingSkip(),
              const OnBoardingDotNavigation(),
              const OnBoardingNextButton() 
          ],
        )
    );
  }
}



