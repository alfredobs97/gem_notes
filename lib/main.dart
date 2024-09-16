import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_notes/data/services/local_storage_service.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';
import 'package:gem_notes/ui/routes.dart';
import 'package:gem_notes/ui/screens/chat/chat_page.dart';
import 'package:gem_notes/ui/screens/home/home_page.dart';
import 'package:gem_notes/ui/screens/splash/splash_page.dart';
import 'package:gem_notes/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(LocalStorageService())..init(),
      child: MaterialApp(
        title: 'Notas con AI',
        theme: buildMaterial3Theme(),
        routes: {
          Routes.splash.name: (_) => const SplashPage(),
          Routes.home.name: (_) => const HomePage(),
          Routes.chat.name: (_) => ChatPage(),
        },
        initialRoute: Routes.splash.name,
      ),
    );
  }
}
