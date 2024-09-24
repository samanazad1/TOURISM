import 'package:flutter/material.dart';

import 'package:tourism/helper/util/sizes.dart';
import 'package:tourism/helper/widgets/carousel_slider/carousel_options.dart';
import 'package:tourism/helper/widgets/carousel_slider/carousel_slider.dart';


class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int index = 0;

  double dotSize = 7.0;
  Color dotColor = Colors.grey[400]!;
  List<String> banners = [
    "assets/images/hawler.jpeg",
    "assets/images/slemany.jpeg",
    "assets/images/gally-sheran.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: 300 / getAbsHeight(context),
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: height * 300 / screenHeight,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Builder(builder: (context) {
                    return Container(
                      
                      margin: EdgeInsets.only(
                          left: 0,
                          right: itemIndex == index
                              ? 10
                              : 40), // Apply padding only to the right
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          banners[itemIndex],
                          
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          height: 300,
                        ),
                      ),
                    );
                  });
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (val, _) {
                    setState(() {
                      index = val;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            // Positioned(
            //   left: 60,
            //   bottom: 10,
            //   child: AnimatedSmoothIndicator(
            //     activeIndex: index,
            //     count: provider.banners.isEmpty ? 1 : provider.banners.length,
            //     effect: const ExpandingDotsEffect(
            //       dotHeight: 3,
            //       dotWidth: 10,
            //       dotColor: Colors.grey,
            //       activeDotColor: secondaryColor,
            //       expansionFactor: 2,
            //     ),
            //   ),
            // )
          ]),
        ],
      ),
    );
  }
}
