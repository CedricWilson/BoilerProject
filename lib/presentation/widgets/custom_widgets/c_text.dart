
import 'package:user_test/presentation/utils/utils.dart';

class CText extends StatelessWidget {
  final dynamic label;
  final Color? color;
  final bool isUnderlined;
  final bool isStriked;
  final double? size;
  final bool center;
  final bool isBold;
  final TextOverflow? overflow;
  final bool multiLine;
  final int? weight;
  final double? height;
  final int? maxLines;
  final bool justify;

  CText(
    this.label, {
    this.color,
    this.size,
    this.weight,
    this.overflow,
    this.isUnderlined = false,
    this.isStriked = false,
    this.center = false,
    this.justify = false,
    this.isBold = false,
    this.multiLine = false,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign(),
      overflow: textOverflow(overflow) ?? TextOverflow.visible,
      maxLines: maxLines,
      softWrap: multiLine,
      text: TextSpan(
          text: label.toString(),
          style: TextStyle(
            fontWeight: fontWeight(),
            height: height,
            fontSize: size??16.sp,
            color: color ?? Colors.black,
            decoration: underline(isUnderlined, isStriked),
          )),
    );
  }

  FontWeight fontWeight() {
    if (weight != null) {
      switch (weight) {
        case 1:
          return FontWeight.w100;
        case 2:
          return FontWeight.w200;
        case 3:
          return FontWeight.w300;
        case 4:
          return FontWeight.w400;
        case 5:
          return FontWeight.w500;
        case 6:
          return FontWeight.w600;
        case 7:
          return FontWeight.w700;
        case 8:
          return FontWeight.w800;
        case 9:
          return FontWeight.w900;
      }
    }
    if (isBold == true) {
      return FontWeight.bold;
    } else {
      return FontWeight.normal;
    }
  }

  double fontsize(double size) {
    return size;
  }

  underline(bool underline, bool isStriked) {
    if (underline == true) {
      return TextDecoration.underline;
    }
    if (isStriked == true) {
      return TextDecoration.lineThrough;
    }
  }

 

  textAlign() {
    if (center) {
      return TextAlign.center;
    } else {
      if (justify) {
        return TextAlign.justify;
      } else {
        return TextAlign.left;
      }
    }
  }

  textOverflow(TextOverflow? overflow) {
    if (overflow == TextOverflow.ellipsis) {
      return TextOverflow.ellipsis;
    }
    return null;
  }


}
