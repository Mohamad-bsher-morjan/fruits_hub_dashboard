import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AddProductView.routeName:
    return MaterialPageRoute(builder: (context) => const AddProductView());
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
