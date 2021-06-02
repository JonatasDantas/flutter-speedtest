import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speedtest_poc/models/speedtest.dart';
import 'package:flutter_speedtest_poc/pages/lifecycle_manager.dart';
import 'package:flutter_speedtest_poc/pages/tabs.dart';

void main() {
  runApp(SpeedTestApp());
}

class SpeedTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeedTestCubit(),
      child: LifeCycleManager(
        child: MaterialApp(
          theme: ThemeData.light(),
          home: TabsPage(),
        ),
      ),
    );
  }
}
