import 'package:benzy/providers/home.dart';
import 'package:benzy/providers/index.dart';
import 'package:benzy/screens/bottomNav.dart';
import 'package:benzy/screens/drawer.dart';
import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderTree.get(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "PT Sans"
        ),
        home: const LandingScreen(),
      ),
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
 @override
  void initState() {
    Provider.of<HomeProvider>(context,listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context,listen: false).init();
     return   SafeArea(
       child: Consumer<HomeProvider>(
         builder: (context,value,child) {
           return Scaffold(
             drawerEnableOpenDragGesture: false,
             backgroundColor: scaffoldBg,
            extendBody: true,
            floatingActionButton: const FloatingMenuButton(),
            endDrawer: const CustomDrawerWidget(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomNavBar(),
             body: value.currentTab,

    );
         }
       ),
     );
  }
}

class FloatingMenuButton extends StatelessWidget {
  const FloatingMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            menuGradient1,menuGradient2
          ],
        ),
      ),
      child: Consumer<HomeProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            backgroundColor: transparent,
            onPressed: () {
              value.setTab(0);
              value.currentTab;
            },
            child: SvgPicture.asset(iconMenu),

          );
        }
      ),
    );
  }
}














