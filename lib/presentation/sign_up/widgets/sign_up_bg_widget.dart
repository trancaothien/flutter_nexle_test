part of '../sign_up_view.dart';

class SignUpBGWidget extends StatelessWidget {
  const SignUpBGWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.6 / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.imgBGAuth),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.6 / 3 + 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorsManager.black,
                Colors.transparent,
              ],
            ),
          ),
        )
      ],
    );
  }
}
