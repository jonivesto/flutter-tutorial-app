
import 'package:esimerkki_app/logic/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().finish();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if(state is SplashFinish){
               Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
            }
          },
          child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Image.asset(
                    "assets/icon/icon.png",
                    height: 140,
                  ),
                ),
              )),
        );
  }
}
