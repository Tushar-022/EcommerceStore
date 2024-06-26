import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  

  // Variables
  final deviceStorage = GetStorage();
  final _auth=FirebaseAuth.instance;

  // get authenticated User Data

  User ? get authUser=>_auth.currentUser;
  

   String getUserID(){
    return _auth.currentUser!.uid;
   }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  @override
  void onInit() {
    super.onInit();
    // Initialization logic here
  }

  // Function to Show Relevant Screen
  Future<void> screenRedirect() async
   {

    final user=_auth.currentUser;

    if(user!=null)
    {

      if(user.emailVerified)
      {
        await TLocalStorage.init(user.uid);
        Get.offAll(()=>const NavigationMenu());
      }
      else{
        Get.offAll(()=>VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    else{

        deviceStorage.writeIfNull('IsFirstTime', true);
        deviceStorage.read('IsFirstTIme')!=true
        ? Get.offAll(()=>const LoginScreen()):
        Get.offAll( OnBoardingScreen());
    }
    
    
  }



  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException (e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException (e.code).message;
  } catch (_) {
    throw 'Something went wrong. Please try again.';
  }
}


  Future<void> sendPasswordResetEmail(String email) async {
  try {

        await _auth.sendPasswordResetEmail(email: email);

  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException (e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException (e.code).message;
  } catch (_) {
    throw 'Something went wrong. Please try again.';
  }
}

/// Email Verification
Future<void> sendEmailVerification() async {
  try {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}



Future<void> logout() async {
  try {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.to(() => const LoginScreen());
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}

Future<void> loginWithEmailAndPassword(String username, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}


/// ReAuthenticate - ReAuthenticate User
/// [ReAuthenticate] - RE AUTHENTICATE USER
Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
  try {
    // Create a credential
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

    // ReAuthenticate
    await _auth.currentUser!.reauthenticateWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

/// -- RE-AUTHENTICATE before deleting


// DELETE USER: Remove User Auth and Firestore Account
Future<void> deleteAccount() async {
  try {
    await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
    await _auth.currentUser?.delete();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

Future<void> removeUserRecord(String userId) async {
  try {
    await _db.collection("Users").doc(userId).delete();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}



/// Email Authentication - FORGET PASSWORD
/// Federated identity e.g. social sign-in


/// Google Authentication
/// 
Future<UserCredential?> signInWithGoogle() async {
  try {
    
    final GoogleSignInAccount? userAccount=await GoogleSignIn().signIn();
    
    // obtain auth details from the request

    final GoogleSignInAuthentication? googleAuth=await userAccount?.authentication;

    final credentials=GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);

    return await _auth.signInWithCredential(credentials);

  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    if(kDebugMode) print('Something went wrong: $e');
    return null;
  }

}



}
