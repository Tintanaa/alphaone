import 'package:alphaone/common/helpers/is_dark_mode.dart';
import 'package:alphaone/common/widgets/appbar/app_bar.dart';
import 'package:alphaone/common/widgets/button/basic_app_button.dart';
import 'package:alphaone/core/configs/assets/app_images.dart';
import 'package:alphaone/core/configs/assets/app_vectors.dart';
import 'package:alphaone/core/configs/theme/app_colors.dart';
import 'package:alphaone/presentation/auth/pages/signin.dart';
import 'package:alphaone/presentation/auth/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.auth,
            ),
          ),
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.toppattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottompattern,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.darkgrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const SignupPage(),
                              ),
                            );
                          },
                          title: 'Register',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const SigninPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
