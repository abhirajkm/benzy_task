import 'dart:ui';

import 'package:benzy/utils/colors.dart';

class Item {
  late int id;
  late String image;
  late String title;
  late Color color;

  Item.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        image = json["image"] ?? "",
        title = json["title"] ?? "",
        color = json["color"] ?? transparent;

  static List<Item> convertToList(List<dynamic> list) {
    return list.map((e) => Item.fromJson(e)).toList();
  }
}
