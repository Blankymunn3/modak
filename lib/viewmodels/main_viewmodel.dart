import 'package:flutter/foundation.dart';

class MainViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  String getTabLabel(int index) {
    switch (index) {
      case 0:
        return '홈';
      case 1:
        return '지도';
      case 2:
        return '기록';
      case 3:
        return '모닥불';
      case 4:
        return '내 정보';
      default:
        return '';
    }
  }
}