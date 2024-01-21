import 'package:benzy/utils/images.dart';
import 'package:benzy/utils/strings.dart';
import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';
import '../utils/image_provider.dart';
import '../utils/styles.dart';

class SelectionItem extends StatelessWidget {
  final String title, img;
  const SelectionItem({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          height: 42,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  url: img, height: 19, width: 19, boxFit: BoxFit.contain),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: titleRegular14,
                ),
              )
              // Text(textTopUpBalance)
            ],
          )),
    );
  }
}

class SelectionList extends StatelessWidget {
  const SelectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: const [
              SelectionItem(title: textTopUpBalance, img: topup),
              SelectionItem(title: textTravelCalendar, img: calender),
            ],
          ),
          Row(
            children: const [
              SelectionItem(title: textNoticeBoard, img: noticeBoard),
              SelectionItem(title: textHoldItineries, img: hold),
            ],
          ),
          Row(
            children: const [
              SelectionItem(title: textSales, img: sales),
              SelectionItem(title: textMyAccount, img: account),
            ],
          ),
        ],
      ),
    );
  }
}
