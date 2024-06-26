import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController{

    static OnBoardingController get instance =>Get.find();
    
    final pageController = PageController();
  Rx<int> currentPageIndex = RxInt(0);// Use RxInt for reactive integer values

  void updatePageIndicator(int index) {
    currentPageIndex.value = index; // Assign value using .value property
  }
    
    void dotNavigationClick(index){
      currentPageIndex.value=index;
      pageController.jumpTo(index.toDouble()); 
    }

    void skipPage(){
      Get.offAll(const LoginScreen());

    }

    void nextPage(){
      if(currentPageIndex.value==2)
      {
        final storage=GetStorage();
        storage.write('isFirstTime',false);
        Get.offAll(const LoginScreen());
      }
      else
      {
        int page=currentPageIndex.value+1;
        pageController.jumpToPage(page);
      }
    }

}