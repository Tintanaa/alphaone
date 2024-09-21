import 'package:alphaone/common/widgets/appbar/app_bar.dart';
import 'package:alphaone/common/widgets/button/basic_app_button.dart';
import 'package:alphaone/core/configs/assets/app_vectors.dart';
import 'package:alphaone/data/models/auth/signin_user_req.dart';
import 'package:alphaone/domain/usecases/auth/signin.dart';
import 'package:alphaone/presentation/home/pages/home.dart';
import 'package:alphaone/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );
                result.fold((l) {
                  var snackbar = SnackBar(
                    content: Text(l as String),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }, (r) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                });
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SigninPage(),
                ),
              );
            },
            child: const Text('Register Now'),
          ),
        ],
      ),
    );
  }
}
