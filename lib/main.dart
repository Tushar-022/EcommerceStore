import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/firebase_options.dart';


Future<void> main() async {

  //Widgets Binding
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //GetX Local Storage
  await GetStorage.init();

  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value) =>Get.put(AuthenticationRepository()),
   );

  Get.lazyPut<UpdateNameController>(() => UpdateNameController());
  Get.lazyPut<CategoryController>(() => CategoryController());
  
  runApp(const App());
}