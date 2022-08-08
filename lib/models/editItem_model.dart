import 'package:flutter/material.dart';

class EditItemViewModel extends ChangeNotifier {
  final HomeService homeService;
  bool _editingItem = false;
  bool get editingItem => _editingItem;

  EditItemViewModel(
    this.homeService,
  );

  Future<void> editItem(Item item) async {
    try {
      _editingItem = true;
      notifyListeners();
      await homeService.editItem(item);
    } finally {
      _editingItem = false;
      notifyListeners();
    }
  }
}
