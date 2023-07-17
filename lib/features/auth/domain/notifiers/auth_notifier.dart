import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/features/auth/data/repositories/auth_repository.dart';
import 'package:pikachat/features/auth/domain/notifiers/auth_state.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authRepositoryProvider)),
);

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState.initial());

  getUser() async {
    final user =  await _authRepository.getCurrentUser();
    state = user.fold(
      (failure) => const AuthState.error(),
      (user) {
        return AuthState.loggedIn(user: user);
      },
    );
  }

  register({required String email, required String password}) async {
    final result = await _authRepository.registerWithEmailAndPassword(email, password);
    state = result.fold(
      (failure) => const AuthState.error(),
      (userCredential) {
        _authRepository.saveUserToken(userCredential.user!); //inace bi isao odma string iz jsona a ne user
        return AuthState.loggedIn(user: userCredential.user);
      },
    );
  }
  
  signIn({required String email, required String password}) async {
    final result = await _authRepository.signInWithEmailAndPassword(email, password);
    state = result.fold(
      (failure) => const AuthState.error(),
      (userCredential) {
        _authRepository.saveUserToken(userCredential.user!); //inace bi isao odma string iz jsona a ne user
        return AuthState.loggedIn(user: userCredential.user);
      },
    );
  }

  signOut() {
    final result = _authRepository.signOut();
    return result;
  }

  bool isUserLoggedIn() => _authRepository.isUserLoggedIn();

}
