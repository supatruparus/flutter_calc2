part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadedState extends UserState{
  UserLoadedState(this.users);

  final List<User> users;

}

class UserLoadingState extends UserState{
  UserLoadingState();
}


class User {
  User({required this.name, required this.id});
  final String name;
  final String id;
}
