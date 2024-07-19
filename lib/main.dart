import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/datasource/services/base_service.dart';
import 'package:tezda_test/core/routes/router.dart';
import 'package:tezda_test/core/utils/providers.dart';
import 'package:tezda_test/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseService.initialized();
  runApp(Tezda());
}

class Tezda extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  final _appRouter = AppRouter(navigatorKey: navigatorKey);
  Tezda({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const MaterialApp(
            title: "Tezda Test",
            initialRoute: "/error",
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            title: "Tezda Test",
            routerConfig: _appRouter.config(),
            builder: (_, router) {
              return MultiProvider(
                providers: Providers.providers,
                child: router!,
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
