import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sefer/features/authentication/presentation/pages/login_page.dart';
import 'package:sefer/injection_container.dart' as di;

import 'package:firebase_core/firebase_core.dart';

import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // Initialize dependency injection
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: BlocProvider(
        create: (_) => sl<AuthenticationBloc>(),
        child: LoginPage(key: UniqueKey()),
      ),
    );
  }
}
