import 'package:TikTok/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TikTok/constants/gaps.dart';
import 'package:TikTok/constants/sizes.dart';
import 'package:TikTok/features/authentication/login_form_screen.dart';

import 'package:TikTok/features/authentication/widgets/auth_button.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    context.pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Log in to App',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Gaps.v20,
              Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: isDarkMode(context)
                      ? Colors.grey.shade300
                      : Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
                child: AuthButton(
                    onTapFunction: _onEmailLoginTap,
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      size: Sizes.size20,
                    ),
                    text: 'Use Email & Password'),
              ),
              Gaps.v16,
              AuthButton(
                  onTapFunction: _onEmailLoginTap,
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    size: Sizes.size20,
                  ),
                  text: 'Continue with Facebook'),
              Gaps.v16,
              AuthButton(
                  onTapFunction: _onEmailLoginTap,
                  icon: const FaIcon(
                    FontAwesomeIcons.apple,
                    size: Sizes.size20,
                  ),
                  text: 'Continue with Apple'),
              Gaps.v16,
              AuthButton(
                  onTapFunction: _onEmailLoginTap,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    size: Sizes.size20,
                  ),
                  text: 'Continue with Google'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: isDarkMode(context) ? null : Colors.grey.shade100,
        child: Padding(
          padding:
              const EdgeInsets.only(top: Sizes.size32, bottom: Sizes.size64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: Text(
                  'Sign up',
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
  }
}
