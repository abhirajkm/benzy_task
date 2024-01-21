import 'package:benzy/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImgProvider extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final double? radius;
  const ImgProvider({
    Key? key,
    this.url,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.color=transparent,
    this.padding,
    this.border,
    this.radius,
  }) : super(key: key);

  Widget _image() {
   if (url!.contains('svg')) {
      return SvgPicture.asset(url!);
    } else if (['png', 'jpg', 'jpeg'].contains(url!.split(".").last)) {
      return Image.asset(
        url!,
        fit: boxFit,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(radius??0.0),
        ),

        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        child: _image());
  }
}
