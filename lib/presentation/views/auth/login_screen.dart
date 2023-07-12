import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_note_app/core/constants/constants.dart';
import 'package:todo_note_app/core/constants/validators.dart';
import 'package:todo_note_app/presentation/shared/custom_dialogs.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_elevated_button.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_textfield.dart';
import 'package:todo_note_app/presentation/shared/custom_social_button.dart';
import 'package:todo_note_app/presentation/views/auth/providers/login/login_form_providers.dart';
import 'package:todo_note_app/presentation/views/auth/signin_screen.dart';

class LoginScreen extends ConsumerWidget {
  static const String path = '/login';
  final GlobalKey<FormState> loginKey = GlobalKey(debugLabel: 'login');

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final loginProviderRead = ref.read(loginFormNotifierProvider.notifier);
    final loginProviderWatch = ref.watch(loginFormNotifierProvider);

    ref.listen(loginFormNotifierProvider, (previous, next) {
      if (previous?.isPosting == true && next.isPosting == false) {
        context.pop();
      }
      if (previous?.isPosting == false && next.isPosting == true) {
        CustomDialogs.loadingDialog(context);
      }
      if (next.errorMessage != null && next.errorMessage != '') {
        CustomDialogs.errorDialog(
          context,
          next.errorMessage ?? '',
        );
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
                child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  CustomShopTextfield(
                    textInputAction: TextInputAction.next,
                    labelText: 'Username',
                    controller: loginProviderRead.emailLoginController,
                    hintText: 'Enter your Username',
                    width: screenSize.width * .8,
                    onChanged: (p0) => loginProviderRead.onEmailChange(),
                    height: 60,
                    validator: (p0) =>
                        validators.validateEmail(email: loginProviderWatch.email ?? '', context: context),
                  ),
                  CustomShopTextfield(
                    height: 60,
                    textInputAction: TextInputAction.next,
                    isPassword: true,
                    labelText: 'Password',
                    controller: loginProviderRead.passwordLoginController,
                    onChanged: (p0) => loginProviderRead.onPasswordChange(),
                    hintText: '• • • • • • • • • • •',
                    width: screenSize.width * .8,
                    validator: (p0) => validators.validatePassword(password: loginProviderWatch.password ?? ''),
                  ),
                  const Spacer(),
                  CustomShopElevatedButton(
                    color: const Color(0xff8687E7),
                    buttonSize: ButtonSize.medium,
                    label: 'Login',
                    onPressed: (loginProviderWatch.email != null && loginProviderWatch.password != null)
                        ? () {
                            if (loginKey.currentState!.validate()) {
                              loginProviderRead.onSubmmitloginButton();
                            }
                          }
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomSocialButton(
                    color: Colors.transparent,
                    onPressed: () {},
                    imagePath: paths.logoGoogle,
                    label: "Login with Google",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomSocialButton(
                    color: Colors.transparent,
                    onPressed: () {},
                    imagePath: paths.logoGoogle,
                    label: "Login with Facebook",
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(color: Colors.grey.shade300.withOpacity(.5)),
                      ),
                      InkWell(
                        child: const Text(" Register"),
                        onTap: () => context.push(SignInScreen.path),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
