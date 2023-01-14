part of '../sign_up_view.dart';

class SignInFormInputWidget extends GetView<SignUpViewModel> {
  const SignInFormInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let’s get you started!',
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 40),
        InputWidget(
          onChangeText: controller.onChangeEmail,
          title: 'Your email',
          controller: controller.emailEditingController,
        ),
        const SizedBox(height: 26),
        Obx(
          () => InputWidget(
            onChangeText: controller.onPasswordChange,
            title: 'Your password',
            maxLenght: 18,
            controller: controller.passworkEditingController,
            obscureText: !controller.isShowPasswork.value,
            suffixIcon: GestureDetector(
              child: controller.isShowPasswork.value
                  ? Icon(Icons.visibility_off,
                      color: Colors.white.withOpacity(0.5))
                  : Icon(Icons.visibility,
                      color: Colors.white.withOpacity(0.5)),
              onTap: controller.onOpenOrCloseEye,
            ),
            borderColor: controller.passwordLevel.value != PasswordLevel.none
                ? ColorsManager.white.withOpacity(0.42)
                : null,
            validateTextColor:
                _getColorPasswordLevel(controller.passwordLevel.value),
            validateText: _getPasswordLevelName(controller.passwordLevel.value),
            validateBorderWidth: _getWidthByPasswordLevel(
                controller.passwordLevel.value, context),
            validateBorderColor:
                _getColorPasswordLevel(controller.passwordLevel.value),
            focusNode: controller.passwordFocusNode,
          ),
        ),
      ],
    );
  }
}

String _getPasswordLevelName(PasswordLevel level) {
  switch (level) {
    case PasswordLevel.Short:
      return 'Too short';
    case PasswordLevel.Weak:
      return 'Weak';
    case PasswordLevel.Fair:
      return 'Fair';
    case PasswordLevel.Good:
      return 'Good';
    case PasswordLevel.Strong:
      return 'Strong';
    default:
      return '';
  }
}

Color _getColorPasswordLevel(PasswordLevel level) {
  switch (level) {
    case PasswordLevel.Short:
      return ColorsManager.white.withOpacity(0.42);
    case PasswordLevel.Weak:
      return ColorsManager.red;
    case PasswordLevel.Fair:
      return ColorsManager.orange;
    case PasswordLevel.Good:
      return ColorsManager.pubple;
    case PasswordLevel.Strong:
      return ColorsManager.green;
    default:
      return ColorsManager.pubple;
  }
}

double _getWidthByPasswordLevel(PasswordLevel level, BuildContext context) {
  switch (level) {
    case PasswordLevel.Short:
      return 0;
    case PasswordLevel.Weak:
      return (MediaQuery.of(context).size.width / 4) - 48;
    case PasswordLevel.Fair:
      return (MediaQuery.of(context).size.width / 2) - 48;
    case PasswordLevel.Good:
      return (MediaQuery.of(context).size.width * 3 / 4) - 48;
    case PasswordLevel.Strong:
      return MediaQuery.of(context).size.width;
    default:
      return 0;
  }
}
