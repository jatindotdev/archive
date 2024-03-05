import 'package:fashiontonic/state/controller.dart';
import 'package:fashiontonic/widgets/banner_pageview.dart';
import 'package:fashiontonic/widgets/custom_chip.dart';
import 'package:fashiontonic/widgets/product.dart';
import 'package:fashiontonic/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = List.filled(5, "assets/banner.jpg");
    final categories = Controller.to.categories;
    final selectedIndex = 0.obs;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: kToolbarHeight + 16,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: kToolbarHeight,
              child: CustomTextField(label: "Search", onChanged: (value) {}),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BannerPageView(
            banners: banners,
          ),
        ),
        SliverAppBar(
          pinned: true,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 72,
          scrolledUnderElevation: 2,
          shadowColor: Colors.black,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CustomChip(
                      label: categories[index],
                      onPressed: () {
                        selectedIndex.value = index;
                        Controller.to.selectedCategory = categories[index];
                      },
                      selected: selectedIndex.value == index,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width - 360 - 32,
              mainAxisSpacing: 16,
              mainAxisExtent: 332,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const GridTile(
                  child: Product(
                    image: "assets/puma.jpg",
                    name: "Men Red Self Designed T-Shirt",
                    price: 49.99,
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
