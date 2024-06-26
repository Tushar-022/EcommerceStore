import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignUpController());
    final dark=THelperFunctions.isDarkMode(context);
    return Form(
              key: controller.signupFormKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstName,
                          validator:(value)=> TValidator.validEmptyText('firstName', value),
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TTexts.firstName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                           controller: controller.lastName,
                            validator:(value)=> TValidator.validEmptyText('Last Name', value),
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TTexts.lastName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  //username
                  TextFormField(
                     controller: controller.username,
                      validator:(value)=> TValidator.validEmptyText('User Name', value),
                     expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.username,
                        prefixIcon: Icon(Iconsax.user_edit)),
                  ),

                  //email
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  TextFormField(
                     controller: controller.email,
                      validator:(value)=> TValidator.validateEmail(value),
                     expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct)),
                  ),

                  //phoneNo
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  TextFormField(
                     controller: controller.phoneNumber,
                      validator:(value)=> TValidator.validatePhoneNumber( value),
                     expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call)),
                  ),

                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  //password
                  Obx(
                  ()=>TextFormField(
                     
                     validator:(value)=> TValidator.validatePassword( value),
                     controller: controller.password,
                     obscureText: controller.hidePassword.value,                   
                    decoration:  InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed:()=>controller.hidePassword.value = !controller.hidePassword.value,
                           icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash:Iconsax.eye)
                          ),
                    )
                  )
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Terms and Condition checkbox

                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                        height: 24,
                        child: Obx(
                          ()=> Checkbox(
                            value: controller.privacyPolicy.value ,
                            onChanged: (value) =>controller.privacyPolicy.value=!controller.privacyPolicy.value,
                          ),
                        ),
                      ),
                     
                      const SizedBox(width: TSizes.spaceBtwInputFields),
                      Text.rich(
                        TextSpan(
                          children: [
                            
                            TextSpan(
                              text: TTexts.iAgreeTo,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),

                            TextSpan(
                              text: TTexts.privacyPolicy,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color: dark
                                        ? TColors.white
                                        : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? TColors.white
                                        : TColors.primary,
                                  ),
                            ),

                            TextSpan(
                                text: TTexts.and,
                                style: Theme.of(context).textTheme.bodySmall),

                            TextSpan(
                              text: TTexts.termsOfUse,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color: dark
                                        ? TColors.white
                                        : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: dark
                                        ? TColors.white
                                        : TColors.primary,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:()=> controller.signup(),
                     child:const Text(TTexts.createAccount) 
                     ),
                  ),
                   ],  
              ),
            );
  }

  }
