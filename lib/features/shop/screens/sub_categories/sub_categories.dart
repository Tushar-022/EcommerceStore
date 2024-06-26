import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_round_image.dart';
import 'package:t_store/common/widgets/products/product_carts/product_cart_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import '../../../../../common/widgets/appbar/appbar.dart';

import '../../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports '), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// BannerR
              const TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.banner3,
                  applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              const SizedBox(height: TSizes.spaceBtwSections / 2),

              /// Sub-Categories

              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                          const TProductCardHorizontal(),
                    ),
                  ),
// SizedBox
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
