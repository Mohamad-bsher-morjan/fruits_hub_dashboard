import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/supabase_config.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.publishableKey,
  );

  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
