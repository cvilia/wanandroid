import 'dart:io';

import 'package:flutter/material.dart';

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    if (Platform.isAndroid) return child;
    return super.buildOverscrollIndicator(context, child, details);
  }
}
