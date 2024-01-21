import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Center(
          child:Text(textRecharge,style: categoryTitleStyle.copyWith(fontWeight: FontWeight.w800,fontSize: 18),)
      ),
    );
  }
}
