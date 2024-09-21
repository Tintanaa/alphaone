import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/data/models/auth/signin_user_req.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
