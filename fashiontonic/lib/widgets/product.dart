import 'package:fashiontonic/screens/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  final String image;
  final String name;
  final double price;

  const Product({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = List.filled(5, "assets/women_tops.avif");
    return InkWell(
      onTap: () => Get.to(
        ProductPage(
          images: images,
        ),
      ),
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xFF191B26)),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                bottom: -20,
                left: 66,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bag),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF191B26),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$price',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF191B26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
