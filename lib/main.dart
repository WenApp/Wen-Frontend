import 'package:app/constants/alarm_attributes.dart';
import 'package:app/presentation/providers/alarm_provider.dart';
import 'package:app/view/test_view.dart';
import 'package:app/view/util/navigation_controller/navigation_controller.dart';
import 'package:app/view/views.dart';
import 'package:app/view/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

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
  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const BaseView(body: AlarmView());
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: ((context, state) {
        return const BaseView(body: NotificationsView());
      }),
    ),
    GoRoute(
      path: '/settings_menu',
      builder: ((context, state) {
        return const BaseView(body: SettingsMenuView());
      }),
    ),
    GoRoute(
      path: '/add_alarm',
      builder: ((context, state) {
        return const BaseOverlayView(body: AddAlarmView(edit: false));
      }),
    ),
    GoRoute(
      path: '/edit_alarm',
      builder: ((context, state) {
        return const BaseOverlayView(body: AddAlarmView(edit: true));
      }),
    ),
  ]);

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
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
