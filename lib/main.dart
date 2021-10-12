import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/presentation/utils/utils.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'di/di.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<User>(UserAdapter());
  if (!kIsWeb) {
    final appDoc = await path.getApplicationDocumentsDirectory();
    Hive.init(appDoc.path);
  }
  await init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __,___) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          getPages: Routes.routes,
        );
      }
    );
  }
}
