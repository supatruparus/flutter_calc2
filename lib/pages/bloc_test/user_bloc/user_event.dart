part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUsers extends UserEvent{

  GetUsers({required this.count});

  final int count;
}
