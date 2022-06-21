import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yoko_test_task/style/app_colors.dart';
import 'package:yoko_test_task/style/app_spaces.dart';
import 'package:yoko_test_task/ui/common/textfield.common.dart';
import 'package:yoko_test_task/ui/pages/activies/activities.page.dart';
import 'package:yoko_test_task/ui/pages/auth/auth.controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthController authProvider;
  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthController>(context);
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryLight,
              AppColors.primary,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Добро пожаловать,\nАвторизуйтесь',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(60),
              TextFieldCommon(
                textController: authProvider.emailCtrl,
                labelText: 'E-mail',
              ),
              verticalSpace(12),
              TextFieldCommon(
                textController: authProvider.passwordCtrl,
                labelText: 'Пароль',
              ),
              verticalSpace(12),
              InkWell(
                onTap: () async {
                  bool isSuccessLogin = await authProvider.login();
                  if (isSuccessLogin) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivitiesPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Произошла ошибка')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Регистрация',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: AppColors.white.withAlpha(100),
                    ),
                  ),
                ],
              ),
              verticalSpace(14),
              const Center(
                child: Text(
                  'Или войдите через:',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDifferentSignIn('ic_google'),
                  horizontalSpace(8),
                  _buildDifferentSignIn('ic_facebook')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifferentSignIn(String icon) {
    return InkWell(
      onTap: () {},
      child: SvgPicture.asset('assets/icons/$icon.svg'),
    );
  }
}
