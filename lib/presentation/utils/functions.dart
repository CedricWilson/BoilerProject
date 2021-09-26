import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

void toast(String? message) {
  Fluttertoast.showToast(
    msg: message!,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
  );
}

lg(dynamic str, {bool? error}) {
  var lg = Logger(printer: PrettyPrinter(methodCount: 0));
  lg.w(str);
}
