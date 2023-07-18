import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/common/domain/either_failure_or.dart';
import 'package:pikachat/common/data/error_to_failure_mixin.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(),
);

abstract class AuthRepository {
  EitherFailureOr<User> getCurrentUser();
  EitherFailureOr<UserCredential> registerWithEmailAndPassword(String email, String password);
  EitherFailureOr<UserCredential> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  bool isUserLoggedIn();
}

class AuthRepositoryImpl with ErrorToFailureMixin implements AuthRepository {
  late FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl() {
    initialize();
  }

  Future<void> initialize() async {
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  EitherFailureOr<User> getCurrentUser() => execute(() async {
    final user = _firebaseAuth.currentUser;
    return Right(user!);
  });

  @override
  EitherFailureOr<UserCredential> registerWithEmailAndPassword(String email, String password) => execute(() async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return Right(userCredential);
  });
  
  @override
  EitherFailureOr<UserCredential> signInWithEmailAndPassword(String email, String password) => execute(() async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return Right(userCredential);
  });
  
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  
  @override
  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}