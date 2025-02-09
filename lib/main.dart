import 'package:ai_agents_vertex_ai/functionality/app_state.dart';
import 'package:ai_agents_vertex_ai/functionality/routes,dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Vertex AI Agent & Flutter Demo',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: context.watch<ThemeNotifier>().brightness,
              seedColor: const Color.fromARGB(255, 171, 222, 244),
            ),
          ),
        );
      },
    );
  }
}