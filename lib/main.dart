import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/constants.dart';
import 'package:fruit_hub_dashboard/core/services/supa_storage.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SupabaseStorageService.initSupabaseStorage();
  await SupabaseStorageService.createBuckets(kImageBucket);
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
