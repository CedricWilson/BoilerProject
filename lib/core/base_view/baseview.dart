import 'package:user_test/presentation/utils/barrel.dart';

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

class Screen extends GetPage {
  Screen({
    final String? name,
    final Function? page,
  }) : super(
          name: name!,
          page: () => page!(),
          transition: Transition.cupertino,
        );
}
