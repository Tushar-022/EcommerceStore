import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  
  static UpdateNameController get instance => Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController=UserController.instance;
  final userRepository=Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey=GlobalKey<FormState>();
  @override
  void onInit(){

    initializeNames();
    super.onInit();
  }



  //Fetch user Record

  Future<void>initializeNames() async{
      firstName.text=userController.user.value.firstName;
      lastName.text=userController.user.value.lastName;

  }

  Future<void> updateUserName() async{
    try{
        TFullScreenLoader.openLoadingDialog('We are updating your info..', TImages.docerAnimation);

        final isConnected=await NetworkManager.instance.isConnected();

        if(!isConnected){
          TFullScreenLoader.stopLoading();
          return;
        }
        
        //Form Validate kr rhe

        if(!updateUserNameFormKey.currentState!.validate())
        {  
           TFullScreenLoader.stopLoading();
          return;
        }
       
      
        Map<String,dynamic>name={
          'FirstName':firstName.text.trim(),
          'LastName':lastName.text.trim()
        };
        

        await userRepository.updateSingleField(name);
      

        userController.user.value.firstName=firstName.text.trim();
        userController.user.value.lastName=lastName.text.trim();

        // print('Challo');

        //Remove Loader

        TFullScreenLoader.stopLoading();

        TLoaders.successSnackBar(title: 'Congrats', message: 'Your Name has been Updated');

        Get.off(()=>const ProfileScreen());

    }

    catch(e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }

  }
}