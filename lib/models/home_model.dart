import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService homeService;
  Future<Home> _HomeFuture;
  Future<Home> get HomeFuture => _HomeFuture;
  HomeViewModel(this.homeService);

  Future<void> loadInitialHome() => _HomeFuture = homeService.getHome();

  Future<void> refreshHome() async {
    _HomeFuture = homeService.getHome();
    notifyListeners();
    await _HomeFuture;
  }

  Future<void> deleteItem(Item item) async {
    await homeService.deleteItem(item);
    await refreshHome();
  }
}
