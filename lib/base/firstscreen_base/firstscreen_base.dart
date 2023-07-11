import 'package:flutter/material.dart';

abstract class MainBaseFirstScreenState<T extends StatefulWidget>
    extends State<T> {
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
}
