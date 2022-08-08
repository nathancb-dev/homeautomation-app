import 'package:flutter/material.dart';

class AddItemViewModel extends ChangeNotifier {
  final HomeService homeService;
  bool _addingItem = false;
  bool get addingItem => _addingItem;
  AddItemViewModel(
    this.homeService,
  );
  Future<void> addItem(Item item) async {
    try {
      _addingItem = true;
      notifyListeners();
      await homeService.addiItem(item);
    } finally {
      _addingItem = false;
      notifyListeners();
    }
  }
}
