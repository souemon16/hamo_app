import 'dart:async';
import 'package:flutter/material.dart';

import 'package:hamo_app/domain/model.dart';
import 'package:hamo_app/presentation/base/baseViewModel.dart';
import 'package:hamo_app/presentation/resources/assets_manager.dart';
import 'package:hamo_app/presentation/resources/routes_manager.dart';
import 'package:hamo_app/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInput, OnboardingViewModelOutput {
  // Stream Controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>.broadcast();

  late final List<SliderObject> _list;
  int currentIndex = 0;

  List<SliderObject> getSliderData = [
    SliderObject(AppStrings.onboardingString1, ImageAssets.onboardingImage1,
        AppStrings.next),
    SliderObject(AppStrings.onboardingString2, ImageAssets.onboardingImage2,
        AppStrings.next),
    SliderObject(AppStrings.onboardingString3, ImageAssets.onboardingImage3,
        AppStrings.getStarted),
  ];

  _postDataToView() {
    inputSliderViewObject
        .add(SliderViewObject(_list[currentIndex], _list.length, currentIndex));
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = getSliderData;
    _postDataToView();
  }

  @override
  void goNext(context, pageController) {
    if (currentIndex == _list.length - 1) {
      Navigator.pushReplacementNamed(context, Routes.chooseSignRoute);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.bounceIn);
    }
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
}

// Input means the orders that our viewModel will receive from our view
abstract class OnboardingViewModelInput {
  void goNext(context, pageController);
  void onPageChanged(int index);

  Sink get inputSliderViewObject; //add data to stream
}

// Input means the data or results that will sent from our viewModel to our view
abstract class OnboardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
