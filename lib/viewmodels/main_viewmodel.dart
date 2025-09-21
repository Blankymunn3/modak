import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class MainViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  String getTabLabel(int index, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (index) {
      case 0:
        return l10n.home;
      case 1:
        return l10n.map;
      case 2:
        return l10n.journal;
      case 3:
        return l10n.community;
      case 4:
        return l10n.profile;
      default:
        return '';
    }
  }
}