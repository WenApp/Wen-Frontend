import 'package:app/constants/alarm_attributes.dart';
import 'package:app/presentation/providers/alarm_provider.dart';
import 'package:app/view/test_view.dart';
import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:app/view/views.dart';
import 'package:app/view/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app/view/util/size/app_size.dart';

import 'data/model/alarm_attribute.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive local storage
  await Hive.initFlutter();
  Hive.registerAdapter(IndicatorTypeAdapter());
  Hive.registerAdapter(OperatorTypeAdapter());
  Hive.registerAdapter(AlertTypeAdapter());
  Hive.registerAdapter(AlarmAttributeAdapter());
  Hive.registerAdapter(OperatorAdapter());
  Hive.registerAdapter(IndicatorAdapter());
  Hive.registerAdapter(AlertAdapter());
  //await Hive.deleteBoxFromDisk('alarms');
  await Hive.openBox<AlarmAttribute>('alarms');

  runApp(MultiProvider(
    providers: [
      ListenableProvider<NavigationController>(
        create: (context) => NavigationController(),
      ),
      ListenableProvider<AppNavBarButtonController>(
        create: (context) => AppNavBarButtonController(),
      ),
      ListenableProvider<AlarmAttributeProvider>(
        create: (context) => AlarmAttributeProvider(),
      )
    ],
    child: const WenApp(),
  ));
}

class WenApp extends StatefulWidget {
  const WenApp({
    Key? key,
  }) : super(key: key);

  @override
  _WenApp createState() => _WenApp();
}

class _WenApp extends State<WenApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavigationController navigation =
        Provider.of<NavigationController>(context);
    return MaterialApp(
      home: Navigator(
        pages: [
          if (navigation.screen == '/alarms')
            const MaterialPage(child: BaseView(body: AlarmView())),
          if (navigation.screen == '/notifications')
            const MaterialPage(child: BaseView(body: NotificationsView())),
          if (navigation.screen == '/settings')
            const MaterialPage(child: BaseView(body: SettingsView())),
          if (navigation.screen == '/add_alarm')
            const MaterialPage(
                child: BaseOverlayView(body: AddAlarmView(edit: false))),
          if (navigation.screen == '/edit_alarm')
            const MaterialPage(
                child: BaseOverlayView(body: AddAlarmView(edit: true))),
          if (navigation.screen == '/test')
            const MaterialPage(child: BaseView(body: TestView()))
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
