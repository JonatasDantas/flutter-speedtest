import 'package:flutter/material.dart';
import 'package:flutter_speedtest_poc/components/platform_button.dart';
import 'package:flutter_speedtest_poc/components/platform_dialog.dart';

class DialogsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformButton(
            child: Text(
              "Dialog with one button",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () => _showOneButtonDialog(context),
          ),
          SizedBox(height: 16.0),
          PlatformButton(
            child: Text(
              "Dialog with two buttons",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () => _showTwoButtonDialog(context),
          ),
        ],
      ),
    );
  }

  _showOneButtonDialog(BuildContext context) async {
    final result = await PlatformDialog(
      title: "Erro na conexão",
      content: "Por favor, tente novamente mais tarde",
      confirmText: "OK",
    ).show(context);

    print("resultado: $result");
  }

  _showTwoButtonDialog(BuildContext context) async {
    final result = await PlatformDialog(
      title: "Logout",
      content: "Tem certeza que deseja sair ?",
      cancelText: "Cancelar",
      confirmText: "Sair",
    ).show(context);

    print("resultado: $result");
  }
}