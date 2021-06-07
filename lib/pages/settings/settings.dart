import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speedtest_poc/models/theme.dart';

class SettingsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, state) {
              return _buildThemeOption(context, state);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(BuildContext context, ThemeData state) {
    return Row(
      children: [
        Text("Tema Dark"),
        Switch(
          value: state == ThemeData.dark(),
          onChanged: (newValue) => _toggleThemeChange(context),
        ),
      ],
    );
  }

  void _toggleThemeChange(BuildContext context) {
    context.read<ThemeCubit>().toggleTheme();
  }
}
