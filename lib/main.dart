import 'package:esimerkki_app/logic/cubit/splash_cubit.dart';
import 'package:esimerkki_app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'constants.dart';
import 'home_page.dart';
import 'logic/cubit/profile_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider<SplashCubit>(
          create: (BuildContext context) => SplashCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.homeRoute:
              return PageTransition(
                  child: const HomePage(
                    title: "Home",
                  ),
                  type: PageTransitionType.rotate,
                  alignment: Alignment.centerLeft);
            case Routes.splashRoute:
              return PageTransition(
                  child: const SplashPage(),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center);
            default:
              return null;
          }
        },
      ),
    );
  }
}
