import 'package:TikTok/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:TikTok/features/authentication/login_screen.dart';
import 'package:TikTok/features/authentication/username_screen.dart';
import 'package:TikTok/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // if (orientation == Orientation.landscape) {
        //   return const Scaffold(
        //       body: Center(
        //           child: Text(
        //               'Please rotate your device to portrait mode to continue')));
        // }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
                child: Column(
                  children: [
                    Gaps.v80,
                    Text(
                      'Sign up for App',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Gaps.v20,
                    Text(
                      'Create a profile, follow other accounts, make your own videos, and more.',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: isDarkMode(context)
                            ? Colors.grey.shade300
                            : Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gaps.v40,
                    AuthButton(
                        onTapFunction: _onEmailSignUpTap,
                        icon: const FaIcon(
                          FontAwesomeIcons.user,
                          size: Sizes.size20,
                        ),
                        text: 'Use Email & Password'),
                    Gaps.v16,
                    AuthButton(
                        onTapFunction: _onEmailSignUpTap,
                        icon: const FaIcon(
                          FontAwesomeIcons.facebook,
                          size: Sizes.size20,
                        ),
                        text: 'Sign up with Facebook'),
                    Gaps.v16,
                    AuthButton(
                        onTapFunction: _onEmailSignUpTap,
                        icon: const FaIcon(
                          FontAwesomeIcons.apple,
                          size: Sizes.size20,
                        ),
                        text: 'Sign up with Apple'),
                    Gaps.v16,
                    AuthButton(
                        onTapFunction: _onEmailSignUpTap,
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: Sizes.size20,
                        ),
                        text: 'Sign up with Google'),
                    Gaps.v16,
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: isDarkMode(context) ? null : Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: Sizes.size32, bottom: Sizes.size64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
