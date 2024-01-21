import 'package:benzy/models/item.dart';
import 'package:benzy/utils/colors.dart';
import 'package:benzy/utils/images.dart';
import 'package:benzy/utils/strings.dart';

class HomeInterface {
  static const  catMenuList = [
    {
      "id" : 1,
      "image": flight,
      "title" :textFlight,
      "color":lightBlueShade
    },
    {
      "id" : 2,
      "image": hotel,
      "title" :textHotel,
      "color":lightPinkBg
    },
    {
      "id" : 3,
      "image": bus,
      "title" :textBus,
      "color":lightGreen
    },
    {
      "id" : 4,
      "image": holidays,
      "title" :textHolidays,
      "color":lightGoldenYellow
    },
    {
      "id" : 5,
      "image": cruise,
      "title" :textCruise,
      "color":white
    },
    {
      "id" : 6,
      "image": holidays,
      "title" :textHolidays,
      "color":white
    },
    {
      "id" : 7,
      "image": train,
      "title" :textTrain,
      "color":white
    },
    {
      "id" : 8,
      "image": visa,
      "title" :textVisa,
      "color":white
    },
  ];
  static const  profileOptions = [
    {
      "id" : 1,
      "image": topup,
      "title" :textTopUpBalance,
    },
    {
      "id" : 2,
      "image": calender,
      "title" :textTravelCalendar,
    },
    {
      "id" : 3,
      "image": noticeBoard,
      "title" :textNoticeBoard,
    },
    {
      "id" : 4,
      "image": hold,
      "title" :textHoldItineries,
    },
    {
      "id" : 5,
      "image": sales,
      "title" :textSales
    },
    {
      "id" : 6,
      "image": account,
      "title" :textMyAccount,
    },
  ];
  static const  horizontalList = [
    {
      "id" : 1,
      "image": sample1,
    },
    {
      "id" : 2,
      "image": sample2
    },
    {
      "id" : 3,
      "image": sample1
    },
    {
      "id" : 4,
      "image": sample2
    },
    {
      "id" : 5,
      "image": sample1
    },

  ];

  static Future<List<Item>> fetchAllCategories() async {

    return Item.convertToList(catMenuList);
  }
  static Future<List<Item>> fetchHorizontalList() async {

    return Item.convertToList(horizontalList);
  }
  static Future<List<Item>> fetchProfileOptions() async {

    return Item.convertToList(profileOptions);
  }
}