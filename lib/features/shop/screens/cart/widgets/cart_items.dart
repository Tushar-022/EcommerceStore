import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products.cart/cart_item.dart';
import 'package:t_store/common/widgets/products.cart/product_price_text.dart';
import 'package:t_store/features/cart/widgets/add_remove_button.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    Key? key,
    this.showAddRemoveButtons = true,
  }) : super(key: key);

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if (showAddRemoveButtons) 
          const SizedBox(height: TSizes.spaceBtwItems),


          /// Add Remove Button Row with total Price
          if(showAddRemoveButtons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70),
                  /// Add Remove Buttons
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),
              /// Product total price
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
