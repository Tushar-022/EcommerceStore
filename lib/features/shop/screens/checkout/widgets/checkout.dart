import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///-- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField

              TCouponCode(), // TRoundedContainer
              const SizedBox(height: TSizes.spaceBtwSections),

              //Billing Section

              // TBillingPaymentSection(),
              // const SizedBox(height: TSizes.spaceBtwItems,),

              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark?TColors.black:TColors.white,
                child:const Column
                ( children: [

                  //Pricing
                  TBillingAmountSection(),
                   SizedBox(height: TSizes.spaceBtwItems),

                  //Divider
                   Divider(),
                   SizedBox(height: TSizes.spaceBtwItems,),

                   TBillingPaymentSection(),
                //r   SizedBox(height: TSizes.spaceBtwItems,),

                  TBillingAddressSection()


                  //Dividor
                  //Payment Method
                  //Address
                ]),
              ),

              //divider
             
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView

        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
           child: ElevatedButton(
              onPressed: ()=>Get.to(()=> SuccessScreen(
                image:TImages.successfulPaymentIcon,
                title:'Payment Success!',
                subtitle: 'Your items will be shipped soon',
                onPressed: () => Get.offAll(()=>const NavigationMenu()),


              )),
               child: const Text('checkout \$250') ,
              ),
         
      ),
   
    );
  }
}

