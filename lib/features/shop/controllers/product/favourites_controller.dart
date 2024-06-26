import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loader.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  // Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  Future<void> initFavorites() async {
    final json = await TLocalStorage.instance().readData('favorites');

    if(json!=null)
    {
      final storedFavourites=jsonDecode(json) as Map<String,dynamic>;
      favorites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
    // Additional logic to handle the retrieved data goes here
  }

  bool isFavourite(String productId) {
  return favorites[productId] ?? false;
}

void toggleFavoriteProduct(String productId) {
  if (!favorites.containsKey(productId)) {
    favorites[productId] = true;
    saveFavoritesToStorage();
    TLoaders.customToast(message: 'Product has been added to the Wishlist.');
  } else {
    TLocalStorage.instance().removeData(productId);
    favorites.remove(productId);
    saveFavoritesToStorage();
    favorites.refresh();
    TLoaders.customToast(message: 'Product has been removed from the Wishlist.');
  }
}

  void saveFavoritesToStorage() {
    final encodedFavorites=json.encode(favorites);
    TLocalStorage.instance().saveData('favorites',encodedFavorites);
  }

}
