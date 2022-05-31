import 'package:flutter/material.dart';
import 'package:hamo_app/presentation/resources/routes_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hamo_app/presentation/resources/assets_manager.dart';
import 'package:hamo_app/presentation/resources/color_manager.dart';
import 'package:hamo_app/presentation/resources/strings_manager.dart';
import 'package:hamo_app/presentation/resources/values_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final List<SliderObject> _list = getSliderData;

  final PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  List<SliderObject> getSliderData = [
    SliderObject(AppStrings.onboardingString1, ImageAssets.onboardingImage1,
        AppStrings.next),
    SliderObject(AppStrings.onboardingString2, ImageAssets.onboardingImage2,
        AppStrings.next),
    SliderObject(AppStrings.onboardingString3, ImageAssets.onboardingImage3,
        AppStrings.getStarted),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: PageView.builder(
        controller: pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(image: AssetImage(_list[index].image)),
                    Text(
                      _list[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: _list.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: ColorManager.primary,
                          dotColor: ColorManager.dotColor,
                          dotHeight: AppSize.s10,
                          dotWidth: AppSize.s14,
                        ),
                      ),
                    ),
                  ],
                )),
                ElevatedButton(
                    onPressed: () {
                      if (currentIndex == _list.length - 1) {
                        Navigator.pushReplacementNamed(
                            context, Routes.chooseSignRoute);
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.bounceIn);
                      }
                    },
                    child: Text(_list[index].buttonMsg)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SliderObject {
  String title;
  String image;
  String buttonMsg;

  SliderObject(this.title, this.image, this.buttonMsg);
}
