import 'package:fashiontonic/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final selectedImageIndex = 0.obs;
    final PageController pageController = PageController(
      initialPage: selectedImageIndex.value,
    );
    final selectedColor = 0.obs;
    final showMore = false.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            pinned: true,
            leadingWidth: 72,
            toolbarHeight: kToolbarHeight + 28,
            leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(CupertinoIcons.arrowtriangle_left_fill),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF191B26)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed("/cart");
                  },
                  icon: const Icon(CupertinoIcons.bag),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                  ),
                ),
              ),
            ],
            surfaceTintColor: Colors.white,
            scrolledUnderElevation: 2,
            shadowColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    onPageChanged: (value) => selectedImageIndex.value = value,
                    controller: pageController,
                    children: [
                      ...images.map(
                        (banner) => banner.startsWith(matchURL)
                            ? Image.network(
                                banner,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                banner,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < images.length; i++)
                          Obx(
                            () => InkWell(
                              onTap: () {
                                selectedImageIndex.value = i;
                                pageController.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: selectedImageIndex.value == i ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: selectedImageIndex.value == i
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(
                    width: Get.size.width * 0.6,
                    child: const Text(
                      "Tokyo Talkies",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "\$198.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.orangeAccent,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "(320 Review)",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Size",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${i + 1}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Size",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0; i < 5; i++)
                        Obx(
                          () => IconButton(
                            onPressed: () => selectedColor.value = i,
                            icon: const Icon(null),
                            selectedIcon:
                                const Icon(CupertinoIcons.checkmark_alt),
                            isSelected: selectedColor.value == i,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // a text with max lines of 3 and ellipsis with readmore button inlined with text that expands the text
                  // and changes the text to read less
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tempore inventore consequatur est aut est. Rem et qui rem ad provident nihil. Quis sed voluptatem soluta. Nesciunt qui ut sint unde omnis asperiores magnam accusamus. Qui distinctio eos ipsum quos maiores dolorem et ut.",
                          maxLines: showMore.value ? 20 : 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () => showMore.value = !showMore.value,
                          child: Text(
                            showMore.value ? "Read Less" : "Read More...",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF191B26),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(CupertinoIcons.bag),
                          SizedBox(width: 8),
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
