import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/features/shop/order/widgets/order_list.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
      final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      
      appBar: TAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        showBackArrow: true,
      ),
      body:const TOrderListItems()
    );
  }
}


