import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speedtest_poc/models/speedtest.dart';
import 'package:flutter_speedtest_poc/models/theme.dart';
import 'package:flutter_speedtest_poc/pages/tabs.dart';

void main() {
  runApp(SpeedTestApp());
}

class SpeedTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SpeedTestCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: buildMaterialApp(),
    );
  }

  BlocBuilder<ThemeCubit, ThemeData> buildMaterialApp() {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          theme: state,
          home: TabsPage(),
        );
      },
    );
  }
}
