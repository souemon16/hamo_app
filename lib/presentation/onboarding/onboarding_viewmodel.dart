import 'package:hamo_app/presentation/base/baseViewModel.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInput, OnboardingViewModelOutput {
  // Stream Controllers

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goPrevious() {
    // TODO: implement _goPrevious
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void onPageChanged() {
    // TODO: implement onPageChanged
  }
}

// Input means the orders that our viewModel will receive from our view
abstract class OnboardingViewModelInput {
  void goNext();
  void goPrevious();
  void onPageChanged();
}

// Input means the data or results that will sent from our viewModel to our view
abstract class OnboardingViewModelOutput {}
