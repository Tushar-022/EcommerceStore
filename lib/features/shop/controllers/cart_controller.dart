import 'package:get/get.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';

class CartController extends GetxController {

  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  // final variationController = VariationController.instance;

//   void addToCart(ProductModel product) {
//     // Quantity Check
//     if (productQuantityInCart.value < 1) {
//       TLoaders.customToast(message: 'Select quantity');
//       return;
//     }

//     // Variation Selected?
//     if (product.productType == ProductType.variable.toString() &&
//         variationController.selectedVariation.value.id.isEmpty) {
//       TLoaders.customToast(message: 'Select Variation');
//       return;
//     }

//     // Out of Stock Status
//     if (product.productType == ProductType.variable.toString()) {
//       if (variationController.selectedVariation.value.stock < 1) {
//         TLoaders.warningSnackBar(
//           message: 'Selected variation is out of stock.',
//           title: 'Oh Snap!',
//         );
//         return;
//       }
//     } else {
//       if (product.stock < 1) {
//         TLoaders.warningSnackBar(
//           message: 'Selected product is out of stock.',
//           title: 'Oh Snap!',
//         );
//         return;
//       }
//     }

//     // Add to cart logic here (if needed)
//   }

 }
