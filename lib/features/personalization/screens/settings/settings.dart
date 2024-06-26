import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_titles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/address/widgets/address.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile.dart';
import 'package:t_store/features/personalization/screens/settings/settings_menu_tile.dart';
import 'package:t_store/features/shop/order/widgets/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
           TPrimaryHeaderContainer(
            child:Column(children: [

            
               TAppBar(title: Text('Account',style:Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

              // User Profile Card

             TUserProfileUser(onPressed:()=>Get.to(()=>const ProfileScreen())),

               const SizedBox(height: TSizes.spaceBtwSections)
               

            ]
            )
          ),

          //Body

            Padding(
  padding: const EdgeInsets.all(TSizes.defaultSpace),
  child: Column(
    children: [
      // Account Settings Section
      const TSectionHeading(title: 'Account Settings',showActionButton: false,),
      const SizedBox(height: TSizes.spaceBtwItems),
      // Settings Menu Tile
       TSettingsMenuTile(
        icon: Iconsax.safe_home,
        title: 'My Address',
        subtitle: 'Set shopping delivery address',
        onTap: ()=>Get.to(()=> const UserAddressScreen()),
      ),

       const TSettingsMenuTile(
        icon: Iconsax.shopping_cart,
        title: 'My Cart',
        subtitle: 'Add, remove products and move to checkout',
      ),

      // SettingsHenuTile 2
       TSettingsMenuTile(
        icon: Iconsax.bag_tick,
        title: 'My Orders',
        subtitle: 'In-progress and Completed Orders',
        onTap:()=>Get.to(()=>  OrderScreen()),
      ),
      // TSettingsMenuTile 3
      const TSettingsMenuTile(
        icon: Iconsax.bank,
        title: 'Bank Account',
        subtitle: 'Withdraw balance to registered bank account',
      ),
      // TSettingsMenuTile 4
      const TSettingsMenuTile(
        icon: Iconsax.discount_shape,
        title: 'My Coupons',
        subtitle: 'List of all the discounted coupons',
      ),
      // SettingsHenuTile 5
      const TSettingsMenuTile(
        icon: Iconsax.notification,
        title: 'Notifications',
        subtitle: 'Set any kind of notification message',
      ),
      // TSettingsMenuTile 6
      const TSettingsMenuTile(
        icon: Iconsax.security_card,
        title: 'Account Privacy',
        subtitle: 'Manage data usage and connected accounts',
      ),

      // App Settings
      
      /// App Settings Section
const SizedBox(height: TSizes.spaceBtwSections),
 const TSectionHeading(title: 'App Settings', showActionButton: false),
const SizedBox(height: TSizes.spaceBtwItems),
 const TSettingsMenuTile(
  icon: Iconsax.document_upload,
  title: 'Load Data',
  subtitle: 'Upload Data to your Cloud Firebase',
),
// SettingsMenuTile 1
TSettingsMenuTile(
  icon: Iconsax.location,
  title: 'Geolocation',
  subtitle: 'Set recommendation based on location',
  trailing: Switch(
    value: true,
    onChanged: (value) {},
  ),
),

// SettingsHenuTile 2
TSettingsMenuTile(
  icon: Iconsax.security_user,
  title: "Safe Mode",
  subtitle: 'Search result is safe for all ages',
  trailing: Switch(
    value: false,
    onChanged: (value) {},
  ),
),

// SettingsMenuTile 3
TSettingsMenuTile(
  icon: Iconsax.image,
  title: "HD Image Quality",
  subtitle: 'Set image quality to be seen',
  trailing: Switch(
    value: false,
    onChanged: (value) {},
  ),
),

//Logout Button

const SizedBox(height: TSizes.spaceBtwSections),

SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () async {
      await logout();
      Get.to(() => const LoginScreen());
    },
    child: const Text('Logout'),
  ),
),


// SizedBox
const SizedBox(height: TSizes.spaceBtwSections * 2.5),



    ],
  ),
),

           // TTSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Adress', subtitle: 'Set Shopping Delivery Address',onTap: (){},)
          
        ],),

      )
    );
  }
  
  Future<void> logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.to(() => const LoginScreen());
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}
}

