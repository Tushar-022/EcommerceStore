import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSpacingStyles{

    static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
      top:TSizes.appBarHeight,
      left:TSizes.defaultSpace,
      bottom: TSizes.defaultSpace,
      right:TSizes.defaultSpace,
    );

    static const double appBarHeight=56.0;
    
}