import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final dark=THelperFunctions.isDarkMode(context);
    final controller=Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [

            //email
            TextFormField(
              controller: controller.emailController,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                labelText: TTexts.email,
              ),
            ),

            //password
            const SizedBox(height: TSizes.spaceBtwInputFields),


             Obx(
                  ()=>TextFormField(
                     
                     validator:(value)=> TValidator.validatePassword( value),
                     controller: controller.passwordController,
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


            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Row(children: [
              //Remember Me

              Row(children: [
                Obx(
                  ()=> Checkbox(
                    value: controller.rememberMe.value,
                     onChanged: (value)=>controller.rememberMe.value=!controller.rememberMe.value)),
                const Text(TTexts.rememberMe),
              ]),

              TextButton(
                  onPressed: ()=>Get.to(()=>const ForgotPassword()), child: const Text(TTexts.forgetPassword)),

              //Forgot Password
            ]),

            
            const SizedBox(height: TSizes.spaceBtwSections),
            
           //SignIn Button
           SizedBox(
            width: double.infinity,
            child:ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              child: const Text(TTexts.signIn),
              ) ,
            ),


            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
