import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child:ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,

        itemBuilder: (_,index){
          return TVerticalImageText(image: TImages.nikeLogo,title: 'Shoes',onTap: () => Get.to(()=>const SubCategoriesScreen()));
        })
    );
   // final categoryController=Get.put(CategoryController());
    
  //   return Obx(() {

  //     if(categoryController.isLoading.value) return const TCategoryShimmer();

  //     if(categoryController.featuredCategories.isEmpty){
  //       return Center(
  //         child: Text('No Data Child',
  //         style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),

  //         ),

  //         );
  //     }

  //     return SizedBox(
  //     height: 80,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: categoryController.featuredCategories.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (_, index) {
  //         final category=categoryController.featuredCategories[index];

  //         return TVerticalImageText(
  //           image: category.image,
  //           title: category.name,
  //           onTap: () => Get.to(() => const SubCategoriesScreen()),
  //         );
  //       },
  //     ),
  //   );
  //   });
  }

}
