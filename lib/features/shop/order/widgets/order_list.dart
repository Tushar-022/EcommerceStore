import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (BuildContext context, int index) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row 1
              Row(
                children: [
                  // Icon
                  Icon(Iconsax.ship),
                  SizedBox(width: TSizes.spaceBtwItems / 2),

                  // Status & Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Processing",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary),
                        ),
                        Text(
                          '04 May 2024',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),

                  // Icon Button
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_34, size: TSizes.sm),
                  ),
                ],
              ),

              // Row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        Icon(Iconsax.tag),
                        SizedBox(width: TSizes.spaceBtwItems / 2),

                        // Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                '[#9999]',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        Icon(Iconsax.calendar),
                        SizedBox(width: TSizes.spaceBtwItems / 2),

                        // Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping Date",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                '05 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
