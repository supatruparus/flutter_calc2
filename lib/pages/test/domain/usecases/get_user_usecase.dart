import 'package:arch_test/pages/test/domain/repository/user_repository.dart';

import '../models/user_model.dart';

class GetUserUseCase {
  GetUserUseCase({required this.userRepository});
  final UserRepository userRepository;
  Future<UserName> execute() async {
    final name = await userRepository.getName();
    return name;
  }
}
