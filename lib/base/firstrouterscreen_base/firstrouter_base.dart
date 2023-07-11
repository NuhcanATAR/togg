import 'package:flutter/widgets.dart';

abstract class MainBaseFirstRouterState<T extends StatefulWidget>
    extends State<T> {
  // screen size
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
}
