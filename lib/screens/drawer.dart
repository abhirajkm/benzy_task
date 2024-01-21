import 'package:benzy/providers/home.dart';
import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/images.dart';
import 'package:benzy/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: scaffoldBg,
      width: 250,
      child: Consumer<HomeProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, lightBlue],
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 24),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage(sample1),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Benzy',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        Text(
                          '@benzy.com',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      iconHome,
                      color: bottomNavGrey,
                    ),
                    title: const Text(textHome),
                    onTap: () {
                      value.setTab(0);
                      value.currentTab;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(iconTrips),
                    title: const Text(textTrips),
                    onTap: () {
                      value.setTab(1);
                      value.currentTab;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(iconProfile),
                    title: const Text(textProfile),
                    onTap: () {
                      value.setTab(3);
                      value.currentTab;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(iconRecharge),
                    title: const Text(textRecharge),
                    onTap: () {
                      value.setTab(4);
                      value.currentTab;
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
