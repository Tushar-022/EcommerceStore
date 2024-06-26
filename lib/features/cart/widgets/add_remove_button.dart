import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/icons/t_circular_icon.dart';
import 'package:t_store/features/cart/widgets/cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
   
  });



  @override
  Widget build(BuildContext context) {
      final bool dark=THelperFunctions.isDarkMode(context);
    return Row(
      
      children: [
        const SizedBox(width: 70),
        //add remove buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: dark ? TColors.white : TColors.black,
              backgroundColor:
                  dark ? TColors.darkerGrey : TColors.light,
            ),
          ],
        ), // TCircularIcon
        const SizedBox(width: TSizes.spaceBtwItems),
         Text('2', style: Theme.of(context).textTheme.titleSmall),
       const  SizedBox(width: TSizes.spaceBtwItems),
        const TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color:TColors.white,
          backgroundColor: TColors.primary
        ),
         // TCircular
      ],
    );
  }
}
