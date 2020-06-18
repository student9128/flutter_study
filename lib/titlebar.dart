import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double kToolbarHeight = 56.0;

class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  TitleBar({
    Key key,
    this.title,
    this.bottom,
  })  : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final Widget title;
  final PreferredSizeWidget bottom;

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
