import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:roqtrade/app/app.bottomsheets.dart';
import 'package:roqtrade/app/app.dialogs.dart';
import 'package:roqtrade/app/app.locator.dart';
import 'package:roqtrade/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'services/utils_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  UtilsService().configLoading();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      builder: EasyLoading.init(),
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
