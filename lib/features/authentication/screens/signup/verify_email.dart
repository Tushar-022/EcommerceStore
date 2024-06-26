import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});


  final String?email;
  @override
  Widget build(BuildContext context) {


    final controller=Get.put( VerifyEmailController());

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () =>AuthenticationRepository.instance.logout(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),

        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage(
                        TImages.deliveredEmailIllustration,
                      ),
                      width: THelperFunctions.screenWidth() * 0.6,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    //title and subTitle

                    Text(
                      TTexts.confirmEmail,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    Text(
                      email??'',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      TTexts.confirmEmailSubTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    //Buttons
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: ()=>controller.checkEmailVerificationStatus(),
                            child: const Text(TTexts.tContinue))),

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //Buttons
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: ()=>controller.sendEmailVerification(),
                        // You can add ButtonStyle here if you want to style the button
                        // For example, to change the button's background color:
                        style: TextButton.styleFrom(
                            // backgroundColor: Colors.blue, // Uncomment and adjust colors as needed
                            ),
                        child: Text(
                          TTexts.resendEmail,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall, // Apply text style here
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
