import 'package:esimerkki_app/home_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SplashPage
 extends StatefulWidget {
  const SplashPage
  ({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    _finish();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope
    (onWillPop: () async{ return false; },
    child: Container(color: Colors.amber, child: Center(child: Image.asset("assets/icon/icon.png", height: 140,),),));
  }
  
  void _finish() async{
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
  }
}