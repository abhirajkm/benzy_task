import 'package:benzy/screens/home/profile.dart';
import 'package:benzy/screens/home/recharge.dart';
import 'package:benzy/screens/home/trip.dart';
import 'package:flutter/cupertino.dart';

import '../interface/home.dart';
import '../models/item.dart';
import '../screens/home/home.dart';

class HomeProvider with ChangeNotifier {
  int tabIndex = 0;
  List<Item> itemList = [];
  List<Item> horizontalItemList = [];
  List<Item> profileOptions = [];

  List<Widget> tabs = [
    const HomeScreen(),
    const TripScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    const RechargeScreen(),
  ];

  Widget get currentTab {
    return tabs[tabIndex];
  }

  void setTab(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void init() {
    fetchAllItems();
    fetchHorizontalList();
    fetchProfileOptions();
  }

  Future<List<Item>> fetchAllItems() async {
    itemList = await HomeInterface.fetchAllCategories();

    notifyListeners();

    return itemList;
  }

  Future<List<Item>> fetchHorizontalList() async {
    horizontalItemList = await HomeInterface.fetchHorizontalList();

    notifyListeners();

    return horizontalItemList;
  }

  Future<List<Item>> fetchProfileOptions() async {
    profileOptions = await HomeInterface.fetchProfileOptions();

    notifyListeners();

    return profileOptions;
  }
}
