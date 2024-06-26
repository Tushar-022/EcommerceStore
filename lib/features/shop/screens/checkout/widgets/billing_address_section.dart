import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {}),

          Text('Tushar Khandelwal',style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: TSizes.spaceBtwItems/2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              '+91-8302806348',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Mansarovar,Jaipur',
                style: Theme.of(context).textTheme.bodyMedium,softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
