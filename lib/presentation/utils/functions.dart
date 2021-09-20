import 'package:fluttertoast/fluttertoast.dart';

void toast(String? message) {
  Fluttertoast.showToast(
    msg: message!,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
  );
}
