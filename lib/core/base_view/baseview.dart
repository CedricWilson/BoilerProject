import 'package:user_test/presentation/utils/utils.dart';

abstract class BaseView extends StatefulWidget {}

abstract class BaseViewState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builder(context),
    );
  }

  Widget builder(BuildContext context);
}

// ignore: must_be_immutable
class Screen extends GetPage {
  Screen({
    required final String name,
    required final Function page,
  }) : super(name: name, page: () => page(), transition: Transition.cupertino);
}
