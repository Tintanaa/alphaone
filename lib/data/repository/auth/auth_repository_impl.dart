import 'package:alphaone/data/models/auth/create_user_req.dart';
import 'package:alphaone/data/models/auth/signin_user_req.dart';
import 'package:alphaone/data/sources/auth/auth_firebase_service.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';
import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
