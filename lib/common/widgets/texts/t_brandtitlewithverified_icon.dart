import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    Key? key,
    required this.title,
    this.textColor,
    this.maxLines = 1,
    this.iconColor = Colors.blue, // Set default icon color here
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  }) : super(key: key);

  final String title;
  final int maxLines;
  final Color? textColor;
  final Color? iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Icons.verified, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}
