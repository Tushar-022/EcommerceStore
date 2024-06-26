import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRatingShare extends StatelessWidget {
  const TRatingShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Rating
        Row(
          children: [
    
               const Icon(Iconsax.star5,
            color:  Color.fromARGB(255, 19, 19, 17), size: 24),
        const SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
    
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '5.0',
              style: Theme.of(context).textTheme.bodyLarge),
          const TextSpan(text: '(200)')
        ]
        )
        ), 
          ],
        ),
      
    
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}
