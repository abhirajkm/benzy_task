import 'package:benzy/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Center(
          child: Text(
        textProfile,
        style: categoryTitleStyle.copyWith(
            fontWeight: FontWeight.w800, fontSize: 18),
      )),
    );
  }
}
