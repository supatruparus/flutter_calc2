import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';
import 'package:arch_test/pages/test/domain/repository/user_repository.dart';

///Не должен зависеть от других слоев!!!

class SaveUserNameUseCase {
  const SaveUserNameUseCase({required this.userRepository});
  final UserRepository userRepository;
  execute({required SaveUserNameParams param}) async {
  }
}
