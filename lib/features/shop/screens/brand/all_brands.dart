import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/t_brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const  TAppBar(title: Text('All Brands'),showBackArrow: true,),

      body: SingleChildScrollView(
        child: 
        Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
          const  TSectionHeading(
              title: "Brands",
              showActionButton: false,
              ),
            
            SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index)=>TBrandCard(
              showBorder: true,
              onTap:()=>Get.to(()=> const BrandProducts()) ))

          ],
        ),

        ),

      ),
    );
  }
}