import 'package:arch_test/pages/test/data/repository/user_repository_impl.dart';
import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';
import 'package:arch_test/pages/test/domain/repository/user_repository.dart';

///Не должен зависеть от других слоев!!!

class SaveUserNameUseCase {
  const SaveUserNameUseCase({required this.userRepository});
  final UserRepository userRepository;
  bool execute({required SaveUserNameParams param}) {
    final bool result = userRepository.saveName(param: param);
    return result;
  }
}
