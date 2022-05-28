import 'dart:convert';

import 'package:bloc/bloc.dart';
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

      Map<String, dynamic> parsed = jsonDecode(response.body);

      name = parsed["results"][0]["name"]["first"];
      avatarUrl = parsed["results"][0]["picture"]["medium"];
      emit(ProfileSuccess(name, avatarUrl));
    } else {
      emit(ProfileFailure());
    }


  }
}
