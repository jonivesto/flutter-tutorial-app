part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String name;
  final String avatarUrl;

  ProfileSuccess(this.name, this.avatarUrl);

}

class ProfileFailure extends ProfileState {}
