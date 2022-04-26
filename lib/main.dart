import 'package:app/presentation/bloc/add_condition_bloc.dart';
import 'package:app/presentation/bloc/set_alarm_bloc.dart';
import 'package:app/view/add_alarm_view.dart';
import 'package:app/view/alarm_view.dart';
import 'package:flutter/material.dart';
import 'package:app/view/util/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/model/alarm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlarmAdapter());
  await Hive.openBox<Alarm>('user_alarms');
  runApp(const WenApp());
}

class WenApp extends StatefulWidget {
  const WenApp({Key? key}) : super(key: key);

  @override
  _WenApp createState() => _WenApp();
}

class _WenApp extends State<WenApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: MaterialApp(home: const AlarmView(), theme: AppTheme.primaryTheme),
      providers: [
        BlocProvider(create: (context) => AlarmBloc(0)),
        BlocProvider(create: (context) => AddConditionCubit([])),
        BlocProvider(
            create: (context) =>
                AddAlarmViewManagerBloc(AddAlarmViewManager([], [], [])))
      ],
    );
  }
}
