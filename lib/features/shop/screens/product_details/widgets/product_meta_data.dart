import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/products.cart/product_price_text.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brandtitlewithverified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            //Sale

            TRoundedContainer(
                    radius: TSizes.md,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('20%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black)
                            )
                            ),

                             const SizedBox(width: TSizes.spaceBtwItems),

                //Price
                Text('\$25',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                const SizedBox(width: TSizes.spaceBtwItems,),
                const TProductPriceText(price:'20',isLarge:true),



            
          ],

        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

         // Title
        const TProductTitleText(title: 'Green Nike Sports Shoes'),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        // Stock Status
         Row(
           children: [
             const TProductTitleText(title: 'Status'),
                  const SizedBox(width: TSizes.spaceBtwItems),
              Text('In Stock',style: Theme.of(context).textTheme.labelMedium,),

                 

           ],
         ),

        // Brand
        Row(
          children: [
            TCircularImage(image: TImages.shoeIcon, isNetworkImage: false,
            width: 32,
            height: 32,
            overlayColor: darkMode?TColors.white:TColors.black,
            ),

            const TBrandTitleWithVerifiedIcon(title: 'Nike',brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
