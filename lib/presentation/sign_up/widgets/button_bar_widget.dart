part of '../sign_up_view.dart';

class ButtonBarWidget extends GetView<SignUpViewModel> {
  const ButtonBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Sign Up', style: Theme.of(context).textTheme.headline2),
        InkWell(
          onTap: () {
            controller.unFocus(context);
            controller.signUp();
          },
          borderRadius: BorderRadius.circular(300),
          child: Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: ColorsManager.pubple),
            ),
            child: Image.asset(Images.icArrowRight),
          ),
        )
      ],
    );
  }
}
