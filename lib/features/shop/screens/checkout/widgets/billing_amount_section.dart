import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

      //Shipping fee
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                    Text('Subtotal',style:Theme.of(context).textTheme.bodyMedium),
                    Text('\$256',style: Theme.of(context).textTheme.bodyMedium),

        ]
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2), 
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                    Text('Shipping Fee',style:Theme.of(context).textTheme.bodyMedium),
                    Text('\$6',style: Theme.of(context).textTheme.bodyMedium),

        ]
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2), 
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                    Text('Order Total',style:Theme.of(context).textTheme.bodyMedium),
                    Text('\$6',style: Theme.of(context).textTheme.titleMedium),

        ]
        ),

        // const SizedBox(height: TSizes.spaceBtwItems/2),
              


        
              

        
        


        




      ],

    );
  }
}