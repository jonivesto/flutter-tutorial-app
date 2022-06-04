import 'package:esimerkki_app/logic/cubit/profile_cubit.dart';
import 'package:esimerkki_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {

        if(state is ProfileSuccess){
          return Column(
          children: [
            Image.network(state.avatarUrl),
            Text(state.name),
            const Divider(),
            ElevatedButton(onPressed: () {
              MyApp.setLocale(context, const Locale("fi",""));
            }, child: const Text("Suomi")),
            ElevatedButton(onPressed: () {
              MyApp.setLocale(context, const Locale("en",""));
            }, child: const Text("English")),
            const Divider(),
            ElevatedButton(onPressed: () {
              MyApp.setTheme(context, "light");
            }, child: const Text("Light")),
            ElevatedButton(onPressed: () {
              MyApp.setTheme(context, "dark");
            }, child: const Text("Dark")),
          ],
        );
        } else if(state is ProfileFailure){
          return const Center(child: Text("Error"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
        
      },
    );
  }
}
