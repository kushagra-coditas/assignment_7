import 'package:assignment_7/domain/usecase/login_usecase.dart';
import 'package:assignment_7/features/login/providers/otp_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPNotifier extends StateNotifier<OTPState> {
  final LoginUsecase loginUsecase;

  OTPNotifier(this.loginUsecase) : super(OTPLoadingState()) {
    loadedOTP();
  }
  Future<void> loadedOTP() async {
    await Future.delayed(Duration(seconds: 2));
    state = OTPLoadedState();
  }

  bool validateOTP(String s) {
    return loginUsecase.call(s);
  }
}

final otpProvider = StateNotifierProvider<OTPNotifier, OTPState>((ref) {
  final loginUsecase = ref.read(loginUsecaseProvider);
  return OTPNotifier(loginUsecase);
});

final otpValueProvider = StateProvider<String>((ref) => '');
