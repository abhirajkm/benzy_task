import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'home.dart';


class ProviderTree {
  static List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: HomeProvider()),
    ];
  }
}
