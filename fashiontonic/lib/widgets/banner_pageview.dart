import 'package:fashiontonic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerPageView extends StatelessWidget {
  const BannerPageView({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = 0.obs;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.vertical,
                onPageChanged: (value) => selectedIndex.value = value,
                children: [
                  ...banners.map(
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
            ),
            // dots for pageview postioned at right center
            Column(
              children: [
                for (int i = 0; i < banners.length; i++)
                  Obx(
                    () => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == selectedIndex.value
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
