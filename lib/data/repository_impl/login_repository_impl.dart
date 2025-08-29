import 'package:assignment_7/domain/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  bool validateOTP(String otp) {
    if(otp == '555555') {
      return true;
    }
      return false;
  }
}

final loginRepositoryImplProvider = Provider<LoginRepository> ((ref) =>
  LoginRepositoryImpl(),
);