import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_note_app/core/constants/constants.dart';
import 'package:todo_note_app/core/constants/validators.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_elevated_button.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_textfield.dart';
import 'package:todo_note_app/presentation/shared/custom_social_button.dart';
import 'package:todo_note_app/presentation/views/auth/providers/sign_in/sign_in_form_provider.dart';

class SignInScreen extends ConsumerWidget {
  static const path = '/signin';
  final GlobalKey<FormState> loginKey = GlobalKey(debugLabel: 'login');

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final registerProviderWatch = ref.watch(signInProvider);
    final registerProviderRead = ref.read(signInProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
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
                    labelText: 'Email',
                    controller: registerProviderRead.emailSignInController,
                    hintText: 'Enter your Email',
                    width: screenSize.width * .8,
                    onChanged: (p0) => registerProviderRead.onEmailChange(),
                    height: 60,
                    validator: (p0) =>
                        validators.validateEmail(email: registerProviderWatch.email ?? '', context: context),
                  ),
                  CustomShopTextfield(
                    height: 60,
                    textInputAction: TextInputAction.next,
                    isPassword: true,
                    labelText: 'Password',
                    controller: registerProviderRead.passwordSignInController,
                    onChanged: (p0) => registerProviderRead.onPasswordChange(),
                    hintText: '• • • • • • • • • • •',
                    width: screenSize.width * .8,
                    validator: (p0) => validators.validatePassword(password: registerProviderWatch.password ?? ''),
                  ),
                  CustomShopTextfield(
                    height: 60,
                    textInputAction: TextInputAction.next,
                    isPassword: true,
                    labelText: 'Confirm Password',
                    controller: registerProviderRead.passwordConfirmController,
                    onChanged: (p0) => registerProviderRead.onConfirmPasswordChange(),
                    hintText: '• • • • • • • • • • •',
                    width: screenSize.width * .8,
                    validator: (p0) => validators.confirmPassword(
                        pass: registerProviderWatch.password ?? '',
                        confirmPass: registerProviderWatch.confirmPassword ?? ''),
                  ),
                  const Spacer(),
                  CustomShopElevatedButton(
                    color: const Color(0xff8687E7),
                    buttonSize: ButtonSize.medium,
                    label: 'Register',
                    onPressed: (registerProviderWatch.email != null &&
                            registerProviderWatch.password != null &&
                            registerProviderWatch.confirmPassword != null)
                        ? () {
                            if (loginKey.currentState!.validate()) {
                              registerProviderRead.onSubmmitSignInButton();
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
                  // const Spacer(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Don't have account?",
                  //       style: TextStyle(color: Colors.grey.shade300),
                  //     ),
                  //     InkWell(
                  //       child: const Text("Register"),
                  //       onTap: () => context.push(SignInScreen.path),
                  //     )
                  //   ],
                  // ),
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
