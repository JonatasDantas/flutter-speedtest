import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class SpeedTestState {
  const SpeedTestState();
}

@immutable
class InitSpeedTestState extends SpeedTestState {
  const InitSpeedTestState();
}

@immutable
class RunningSpeedTestState extends SpeedTestState {
  final double downloadSpeed;

  const RunningSpeedTestState(this.downloadSpeed);
}

@immutable
class CompletedSpeedTestState extends SpeedTestState {
  const CompletedSpeedTestState();
}

class SpeedTestCubit extends Cubit<SpeedTestState> {
  SpeedTestCubit() : super(InitSpeedTestState());

  void startTest() {
    emit(RunningSpeedTestState(5.0));

    // mock for speedometer simulation
    // runs every 1 second
    Timer.periodic(new Duration(seconds: 2), (timer) {
      final currentState = this.state;

      if (currentState is RunningSpeedTestState) {
        print(currentState.downloadSpeed + 2.5);
        emit(RunningSpeedTestState(currentState.downloadSpeed + 2.5));
      } else {
        timer.cancel();
      }
    });
  }

  void cancelTest() => emit(InitSpeedTestState());
  void completeTest() => emit(CompletedSpeedTestState());
}
