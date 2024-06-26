import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/products.cart/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 1 - Product Image Slider
            TProductImageSlider(),

            //2- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(children: [
                //Rating & Share

                const TRatingShare(),

               


                
                //Price Title Stock Brand

               const ProductMetaData(),
                //Attributes

                  const TProductAttributes(),
                //Checkout Button
                const SizedBox(height: TSizes.spaceBtwSections),

                 SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwItems),
              
                //Description

                const TSectionHeading(title: 'Description',showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'This is project description,This is project description,This is project description,This is project description ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Less',
                  moreStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                ),

                //Reviews
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      const TSectionHeading(title: 'Reviews(199)',showActionButton: false,),
                        IconButton(onPressed: ()=>Get.to(()=>const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3,size: 18,))

                  ],
                )
                  
                

              ]),
            )
          ],
        ),
      ),
    );
  }
}

