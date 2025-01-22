import 'package:book_store/Core/constants/constants.dart';
import 'package:book_store/book_store_app_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/utils/bolc_observer.dart';
import 'Core/utils/shared_preferences.dart';
import 'Features/Authentication/presentation/views/authentication_screen.dart';
import 'Features/home/presentation/views/app_layout.dart';
import 'Core/utils/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userEmail = await Shared.getDate('email') ?? '';
  Widget screen;
  if (userEmail != '') {
    screen = const AppLayout();
  } else {
    screen = const AuthenticationScreen();
  }
  runApp(BookStoreApp(screen));
}