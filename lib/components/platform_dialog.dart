import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedtest_poc/components/platform_widget.dart';

class PlatformDialog extends PlatformWidget {
  PlatformDialog({
    @required this.title,
    @required this.content,
    @required this.confirmText,
    this.cancelText,
  })  : assert(title != null),
        assert(content != null),
        assert(confirmText != null);

  final String title;
  final String content;
  final String cancelText;
  final String confirmText;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _actions(context, cancelText, confirmText),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _actions(context, cancelText, confirmText),
    );
  }

  List<Widget> _actions(
      BuildContext context, String cancelText, String confirmText) {
    List actions = <Widget>[];

    if (cancelText != null) {
      actions.add(PlatformDialogAction(
        child: Text(cancelText),
        onPressed: () => _dismiss(context, false),
      ));
    }

    actions.add(PlatformDialogAction(
      child: Text(confirmText),
      onPressed: () => _dismiss(context, true),
    ));

    return actions;
  }

  void _dismiss(BuildContext context, bool value) {
    Navigator.of(context, rootNavigator: true).pop(value);
  }

  Future<bool> show(BuildContext context) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => this,
    );

    return Future.value(result ?? false);
  }
}

class PlatformDialogAction extends PlatformWidget {
  PlatformDialogAction({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
