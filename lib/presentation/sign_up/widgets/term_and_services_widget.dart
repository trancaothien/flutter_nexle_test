part of '../sign_up_view.dart';

class TermAndServicesWidget extends GetView<SignUpViewModel> {
  const TermAndServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: controller.onSelectTermService,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ColorsManager.pubple),
                  borderRadius: BorderRadius.circular(AppRadius.r4),
                ),
                child: Obx(
                  () => controller.isAllowTermAndService.value
                      ? Image.asset(
                          Images.icCheckBox,
                          color: ColorsManager.white,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'I am over 16 years of age',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
            text:
                'By clicking Sign Up, you are indicating that you have read and agree to the',
            style: Theme.of(context).textTheme.subtitle2,
            children: [
              TextSpan(
                text: 'Terms of Service',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: ColorsManager.pubple,
                    ),
              ),
              TextSpan(text: ' and'),
              TextSpan(
                text: ' Privacy Policy',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: ColorsManager.pubple,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
