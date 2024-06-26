import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/form_divider.dart';
import 'package:t_store/common/widgets/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
             crossAxisAlignment:CrossAxisAlignment.start,
            children: [
             
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              const TSignUpForm(),

                    const SizedBox(height: TSizes.spaceBtwSections,),

                   TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

                   const SizedBox(height: TSizes.spaceBtwSections,),

                   const TsocialButtons(),
                 
            ],
          ),
        ),
      ),
    );
  }
}

 
