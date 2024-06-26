import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/products.cart/product_price_text.dart';
import 'package:t_store/common/widgets/products/product_carts/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  Column(

      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          child: Column(children: [
            //title price and stock status
                Row(
                  children: [
                        const TSectionHeading(title: 'Variation',showActionButton: false,),
                        const SizedBox(width: TSizes.spaceBtwItems),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [


                              //Actual Price
                              const TProductTitleText(title: 'Price',smallSize: true,),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              Text(
                                '\$25',
                                style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),

                              ),

                              const SizedBox(width: TSizes.spaceBtwItems,),

                              //Sales price

                              const TProductPriceText(price: '20'),


                            ]
                            ),

                           
                            
                          ],
                        )


                  ],
                ),

                 Row(children: [
                              const TProductTitleText(title: 'Stock:',smallSize: true,),
                              Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
                            ],),

                            const TProductTitleText(title: 'This is the Description of the Product and it can go up to max 4 Lines',
                            smallSize:true,
                            maxLines: 4,
                            ),

          ]),
        ),

      const SizedBox(height: TSizes.spaceBtwItems),

      //Attributes

       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const TSectionHeading(title: 'Colors'),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Wrap(
          spacing: 0,
          children: [
            TChoiceChip(text:'Green', selected: false,onSelected: (value){}),
             TChoiceChip(text:'Blue', selected: true,onSelected: (value){}),
              TChoiceChip(text:'Yellow', selected: false,onSelected: (value){})
          ],
        )
      ]
      ),

       Column
      (
        children: 
      [
        const  TSectionHeading(title: 'Size',showActionButton: false),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
         Wrap(
          spacing: 8,
          children: [
            TChoiceChip(text: "EU 34", selected: true,onSelected: (value){},),
            TChoiceChip(text: "EU 36", selected: true,onSelected: (value){}),
            TChoiceChip(text: "EU 38", selected: true,onSelected: (value){}),
             TChoiceChip(text: "EU 40", selected: true,onSelected: (value){}),
            TChoiceChip(text: "EU 42", selected: true,onSelected: (value){})
         ],)
       

      ]
        )
      

      ],

    );
  }
}