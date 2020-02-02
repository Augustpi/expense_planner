import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String label;
  final Function handler;

  AdaptiveFlatButton(this.label, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
          );
  }
}
