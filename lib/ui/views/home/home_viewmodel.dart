import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void onCenterButtonTap() {}
}
