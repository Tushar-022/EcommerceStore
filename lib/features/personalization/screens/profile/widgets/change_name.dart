import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
  // final controller=Get.put(UpdateNameController());
    final controller = Get.find<UpdateNameController>();

    return Scaffold(
      appBar: TAppBar(showBackArrow: true,
      title: Text('Change Name',style:Theme.of(context).textTheme.headlineSmall),

      ),

      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text('Use real name for easy verification',
            style:Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: TSizes.spaceBtwSections,),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  /// First Name Text Field
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  /// Last Name Text Field
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            //Save Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.updateUserName(),
                child: const Text('Save'),
              ),
            ),

          ],
        
        ),
        ),

    );
  }
}