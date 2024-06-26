import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/t_brand_card.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String>images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(children: [
        //Brand with prod cnt
          const TBrandCard(showBorder:false),
        //brand top 3 images
        Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
        )
      ]),
    );
  }
  Widget brandTopProductImageWidget(String image,context){
   return Expanded(
            child: TRoundedContainer(
              height: 100,
              backgroundColor: THelperFunctions.isDarkMode(context)?TColors.darkerGrey:TColors.light,
              margin: const EdgeInsets.only(right:TSizes.sm),
              padding: const EdgeInsets.all(TSizes.md),
              child:  Image(fit: BoxFit.contain,image: AssetImage(image)),
            ),
          );
  }
}
