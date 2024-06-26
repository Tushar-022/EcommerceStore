import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_carts/product_cart_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
            .map((option) => DropdownMenuItem(value: option, child: Text(option)))
            .toList(),
        ),
    
    
        const SizedBox(
          height: TSizes.spaceBtwSections,
    
        ),
    
        TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical()),
        
        // DropdownButtonFormField
      
    // DropdownButtonFormField
    
    
    
      ],
    );
  }
}