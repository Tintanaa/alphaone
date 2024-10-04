import 'package:alphaone/core/usecase/usecase.dart';
import 'package:alphaone/domain/repository/auth/auth.dart';
import 'package:alphaone/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }
}
