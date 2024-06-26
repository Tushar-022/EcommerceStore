import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class TFullScreenLoader {
  // Open a full-screen loading dialog with a given text and animation.
  // This method doesn't return anything.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading diatog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
// Close the dialog using the Navigator
  }
}
