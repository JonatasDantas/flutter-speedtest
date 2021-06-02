import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speedtest_poc/components/platform_widget.dart';

class PlatformButton extends PlatformWidget {
  PlatformButton({Key key, this.child, this.color, this.onPressed})
      : super(key: key);
  final Widget child;
  final Color color;
  final Function onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      child: child,
      color: color,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: child,
      color: color,
      onPressed: onPressed,
    );
  }
}
