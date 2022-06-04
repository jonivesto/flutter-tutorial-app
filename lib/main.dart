import 'package:esimerkki_app/logic/cubit/splash_cubit.dart';

import 'package:esimerkki_app/ui/home_page.dart';
import 'package:esimerkki_app/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

import 'logic/cubit/profile_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static setLocale(BuildContext context, Locale locale) async{
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    // ignore: invalid_use_of_protected_member
    state?.setState(() {
      state._locale = locale;
    });

    var preferences = await SharedPreferences.getInstance();
    preferences.setString("language", locale.languageCode);
  }

  static setTheme(BuildContext context, String themeName) async{
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    state?.setState(() {
      state._theme = Themes.getThemeByName(themeName);
    });

    var preferences = await SharedPreferences.getInstance();
    preferences.setString("theme", themeName);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale = const Locale('fi', '');
  ThemeData _theme = Themes.lightTheme;
  
  @override
  void initState() {
    super.initState();
    _getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    _getTheme().then((theme) {
      setState(() {
        _theme = theme;
      });
    });
  }

  Future<Locale> _getLocale() async{
    var preferences = await SharedPreferences.getInstance();
    String language = preferences.getString("language") ?? "fi";

    return Locale(language, "");
  }

  Future<ThemeData> _getTheme() async{
    var preferences = await SharedPreferences.getInstance();
    String themeName = preferences.getString("theme") ?? "light";

    return Themes.getThemeByName(themeName);
  }

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
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('fi', ''),
        ],
        theme: _theme,
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
