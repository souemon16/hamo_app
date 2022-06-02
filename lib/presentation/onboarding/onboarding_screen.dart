import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hamo_app/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:hamo_app/presentation/resources/color_manager.dart';
import 'package:hamo_app/presentation/resources/values_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingViewModel _onBoardingViewModel = OnboardingViewModel();
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _onBoardingViewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _onBoardingViewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: ColorManager.secondary,
            body: PageView.builder(
              controller: pageController,
              itemCount: _onBoardingViewModel.getSliderData.length,
              onPageChanged: (index) {
                _onBoardingViewModel.onPageChanged(index);
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                    onBoardingViewModel: _onBoardingViewModel,
                    pageController: pageController,
                    index: index);
              },
            ),
          );
        });
  }
}

class OnboardingPage extends StatelessWidget {
  OnboardingPage(
      {Key? key,
      required OnboardingViewModel onBoardingViewModel,
      required this.pageController,
      required this.index})
      : _onBoardingViewModel = onBoardingViewModel,
        super(key: key);

  final OnboardingViewModel _onBoardingViewModel;
  final PageController pageController;
  int index;

  @override
  Widget build(BuildContext context) {
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
              Image(
                  image: AssetImage(
                      _onBoardingViewModel.getSliderData[index].image)),
              Text(
                _onBoardingViewModel.getSliderData[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: _onBoardingViewModel.getSliderData.length,
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
                _onBoardingViewModel.goNext(context, pageController);
              },
              child: Text(_onBoardingViewModel.getSliderData[index].buttonMsg)),
        ],
      ),
    );
  }
}
