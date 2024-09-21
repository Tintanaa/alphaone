import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/data/models/auth/create_user_req.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';
import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
