import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:esimerkki_app/logic/model/random_user.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfile() async{
    var url = Uri.parse(Apis.profileApi);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200){
      String name;
      String avatarUrl;

      RandomUser user = RandomUser.fromJson(jsonDecode(response.body)["results"][0]);

      name = user.name.title;
      avatarUrl = user.picture.medium;
      emit(ProfileSuccess(name, avatarUrl));
    } else {
      emit(ProfileFailure());
    }


  }
}
