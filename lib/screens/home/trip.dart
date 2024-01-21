import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/strings.dart';
import 'package:benzy/utils/styles.dart';
import 'package:flutter/material.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Center(
        child:Text(textTrips,style: categoryTitleStyle.copyWith(fontWeight: FontWeight.w800,fontSize: 18),)
      ),
    );
  }
}
