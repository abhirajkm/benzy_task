import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/images.dart';
import 'package:benzy/utils/strings.dart';
import 'package:benzy/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/view.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomAppBar(
          color: white,
          shape: CustomCircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: const BottomNav()),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext ctx) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: value.tabIndex,
        selectedLabelStyle: categoryTitleStyle.copyWith(color: blue),
        unselectedLabelStyle: categoryTitleStyle.copyWith(color: bottomNavGrey),
        onTap: (int index) {
          value.setTab(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: textHome,
              icon: SvgPicture.asset(
                iconHome,
                color: bottomNavGrey,
              ),
              activeIcon: SvgPicture.asset(
                iconHome,
                color: blue,
              )),
          BottomNavigationBarItem(
              label: textTrips,
              icon: SvgPicture.asset(iconTrips),
              activeIcon: SvgPicture.asset(
                iconTrips,
                color: blue,
              )),
          BottomNavigationBarItem(label: "", icon: Container()),
          BottomNavigationBarItem(
              label: textProfile,
              icon: SvgPicture.asset(iconProfile),
              activeIcon: SvgPicture.asset(
                iconProfile,
                color: blue,
              )),
          BottomNavigationBarItem(
              label: textRecharge,
              icon: SvgPicture.asset(iconRecharge),
              activeIcon: SvgPicture.asset(
                iconRecharge,
                color: blue,
              )),
        ],
        selectedItemColor: blue,
      ),
    );
  }
}

class CustomBottomNavItem extends StatelessWidget {
  final String title, icon;
  const CustomBottomNavItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          height: 5,
        ),
        Text(title)
      ],
    );
  }
}
