import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/text_style.dart';
import '../../common/component/login_text_form_field.dart';
import '../../common/layout/default_layout.dart';
import '../viewmodel/user_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return DefaultLayout(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              Text('이메일 로그인', style: TextStyles.titleMedium1),
              const SizedBox(height: 30),
              LoginTextFormField(
                hintText: '이메일을 입력해주세요',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '이메일을 입력해주세요';
                  } else if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
                  ).hasMatch(value)) {
                    return '올바른 이메일 형식을 입력해주세요.';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 10),
              LoginTextFormField(
                hintText: '비밀번호를 입력해주세요',
                controller: passwordController,
                textInputAction: TextInputAction.done,
                isObscure: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '비밀번호를 입력해주세요';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  if (formKey.currentState!.validate()) {
                    ref.read(userProvider.notifier).login(
                      id: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: (ref.read(userProvider).isLoading)
                    ? null
                    : ()async{
                  if (formKey.currentState!.validate()) {
                    await ref.read(userProvider.notifier).login(
                      id: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: Text(
                  '로그인',
                  style: TextStyles.contentMedium2.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
