import 'package:benzy/providers/home.dart';
import 'package:benzy/screens/data.dart';
import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/image_provider.dart';
import 'package:benzy/utils/images.dart';
import 'package:benzy/utils/strings.dart';
import 'package:benzy/utils/styles.dart';
import 'package:benzy/utils/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../models/item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fullHeight(context),
      child: ListView(
        children: const [
          MainCategoryComponent(),
          HorizontalListWidget(),
          ProfileOptionWidget()
        ],
      ),
    );
  }
}

class MainCategoryComponent extends StatelessWidget {
  const MainCategoryComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBg(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: fullHeight(context) * .04,
            ),
            const Expanded(
              flex: 2,
              child: BasicInfoWidget(),
            ),
            const Expanded(flex: 3, child: CategoryListWidget()),
          ],
        ),
      ),
    );
  }
}

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: SvgPicture.asset(iconTopMenu)),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                textBenzy,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: white),
              ),
              const Text(
                textAgentCode,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: grey),
                height: 26,
                //width: 250,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      textMainBalance,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: textGrey),
                    ),
                    const Text(
                      inr,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: "",
                          color: textGrey),
                    ),
                    const Text(
                      textBalance,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: textGrey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: VerticalDivider(
                        color: textGrey,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(iconArrowGrey)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: white),
              height: 167,
              width: fullWidth(context)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 167,
              child: Consumer<HomeProvider>(builder: (context, value, child) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: value.itemList.length,
                  itemBuilder: (context, index) =>
                      CategoryItem(cartItem: value.itemList[index]),
                );
              }),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: grey),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    textMoreServices,
                    style: categoryTitleStyle.copyWith(color: blue),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(iconArrowBlue)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 38,
        ),
        SelectionList(),
        /* Consumer<HomeProvider>(builder: (context, value, child) { //todo using wrap
          return Wrap(
            runSpacing: 15.0,
            spacing: 10,
            children: value.profileOptions.map((e) => CategoryMenuItem(profileOption: e)).toList()
          );
        },),*/
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class CategoryMenuItem extends StatelessWidget {
  final Item profileOption;
  const CategoryMenuItem({
    Key? key,
    required this.profileOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: white,
            boxShadow: const [
              BoxShadow(color: shadowGrey, blurRadius: 3.0, spreadRadius: 1.0)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImgProvider(
                url: profileOption.image,
                height: 19,
                width: 19,
                boxFit: BoxFit.contain),
            const SizedBox(
              width: 10,
            ),
            Text(
              profileOption.title,
              style: titleRegular14,
            )
            // Text(textTopUpBalance)
          ],
        ));
  }
}

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Consumer<HomeProvider>(
            builder: (context, value, child) => SizedBox(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.horizontalItemList.length,
                  itemBuilder: (context, index) {
                    return HorizontalListItem(
                        horizontalItem: value.horizontalItemList[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final Item horizontalItem;
  const HorizontalListItem({
    Key? key,
    required this.horizontalItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(horizontalItem.image), fit: BoxFit.fill)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textMoreDetails,
            style: categoryTitleStyle.copyWith(color: blue),
          )
        ],
      ),
    );
  }
}

class GradientBg extends StatelessWidget {
  final Widget body;
  const GradientBg({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fullHeight(context) / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                height: fullHeight(context) / 3,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [lightBlue, blue])),
              ),
              Container(
                color: scaffoldBg,
                height: fullHeight(context) / 6,
              )
            ],
          ),
          body
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Item cartItem;
  const CategoryItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: cartItem.color),
              child: Center(
                  child: ImgProvider(
                url: cartItem.image,
                height: 35,
                width: 35,
                boxFit: BoxFit.contain,
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              cartItem.title,
              overflow: TextOverflow.ellipsis,
              style: categoryTitleStyle,
            ),
          )
        ],
      ),
    );
  }
}
