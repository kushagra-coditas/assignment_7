import 'package:assignment_7/data/repository_impl/login_repository_impl.dart';
import 'package:assignment_7/domain/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginUsecase {

  final LoginRepository loginRepository;

  LoginUsecase(this.loginRepository);

  bool call(String otp) {
    return loginRepository.validateOTP(otp);
  }
}

final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  final loginRepository = ref.read(loginRepositoryImplProvider);
  return LoginUsecase(loginRepository);
});

