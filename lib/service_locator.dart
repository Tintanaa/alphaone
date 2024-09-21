import 'package:alphaone/data/repository/auth/auth_repository_impl.dart';
import 'package:alphaone/data/sources/auth/auth_firebase_service.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';
import 'package:alphaone/domain/usecases/auth/signin.dart';
import 'package:alphaone/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
