import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller=UserController.instance;

    return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Profile Pic
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Obx((){
                          final profilePicture = controller.user.value.profilePicture as String; // Ensure profilePicture is cast to String
                          final imageUrl = profilePicture; // Assuming profilePicture is already a URL string
                          return controller.imageUploading.value? const TShimmerEffect(width: 80, height: 80): TCircularImage(
                            image: imageUrl,
                            isNetworkImage: imageUrl.isNotEmpty,
                            width: 80,
                            height: 80,
                          );
                        }
                         
                        ),
                        TextButton(
                            onPressed:()=>controller.uploadUserProfilePicture(),
                            child: const Text('Change profile picture'))
                      ],
                    ),
                  ),

                  //Details

                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                      title: 'Profile Information', showActionButton: false),

                  //Profile Info
                  TProfileMenu(
                    title: 'Name',
                    value: controller.user.value.fullName,
                    onPressed:()=>Get.to(()=>const ChangeName()) , // Replace () with your onPressed function
                  ),

                  TProfileMenu(
                    title: 'Username',
                    value: controller.user.value.username,
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    icon: Iconsax.copy,
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  TProfileMenu(
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  TProfileMenu(
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  TProfileMenu(
                    title: 'Gender',
                    value: 'Male',
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  TProfileMenu(
                    title: 'Date of Birth',
                    value: '5 Feb,2002',
                    onPressed: () {}, // Replace () with your onPressed function
                  ),

                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Center(
                    child: TextButton(
                      onPressed:()=>controller.deleteAccountWarningPopup(),
                      child: const Text('Close Account',style: TextStyle(color: Colors.red)),
                    ),
                  )

                ],
              )),
        ));
  }
}
