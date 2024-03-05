import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();

  final _selectedNavIndex = 0.obs;

  int get selectedNavIndex => _selectedNavIndex.value;
  set selectedNavIndex(int index) {
    _selectedNavIndex.value = index;
  }

  final _selectedCategory = "all".obs;

  String get selectedCategory => _selectedCategory.value;
  set selectedCategory(String category) {
    _selectedCategory.value = category.toLowerCase();
  }

  final _categories = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Shoes",
    "Bags",
    "Accessories"
  ];

  List<String> get categories => _categories;
}
