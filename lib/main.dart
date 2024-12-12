import 'package:bloc/bloc.dart';
import 'package:book_store/Core/utils/style/colors.dart';
import 'package:book_store/Features/home/presentation/view_model/app_cubit/app_cubit.dart';
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
  bool isFirstTime = await Shared.getDate('isFirstTime') ?? false;
  Widget screen;
  if (isFirstTime) {
    screen = const AppLayout();
  } else {
    screen = const AuthenticationScreen();
  }
  runApp(BookStoreApp(screen));
}

class BookStoreApp extends StatelessWidget {
  final Widget screen;

  const BookStoreApp(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBooks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Merriweather',
        ),
        home: AuthenticationScreen(),
      ),
    );
  }
}
