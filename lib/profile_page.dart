import 'package:esimerkki_app/logic/cubit/profile_cubit.dart';
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
            Text(state.name)
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