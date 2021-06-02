import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speedtest_poc/components/platform_button.dart';
import 'package:flutter_speedtest_poc/components/speedometer.dart';
import 'package:flutter_speedtest_poc/models/speedtest.dart';

class DashboardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardView();
  }
}

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<SpeedTestCubit, SpeedTestState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  _buildSpeedometer(state),
                  _buildSpeedTestButton(state, context),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Speedometer _buildSpeedometer(SpeedTestState state) {
    double speed = 0;

    if (state is RunningSpeedTestState) {
      speed = state.downloadSpeed;
    }

    return Speedometer(
      speed: speed,
    );
  }

  PlatformButton _buildSpeedTestButton(
      SpeedTestState state, BuildContext context) {
    return PlatformButton(
      child: Text(
        state is RunningSpeedTestState
            ? "Parar Teste"
            : "Executar estado de teste",
        style: TextStyle(color: Colors.white),
      ),
      color:
          state is RunningSpeedTestState ? Colors.red[600] : Colors.blue[300],
      onPressed: () => toggleSpeedTest(context, state),
    );
  }

  toggleSpeedTest(BuildContext context, SpeedTestState state) {
    if (state is RunningSpeedTestState) {
      return context.read<SpeedTestCubit>().cancelTest();
    }

    return context.read<SpeedTestCubit>().startTest();
  }
}
