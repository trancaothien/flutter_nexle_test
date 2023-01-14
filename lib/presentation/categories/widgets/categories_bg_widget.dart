part of '../categories_view.dart';

class CategoriesBGWidget extends StatelessWidget {
  const CategoriesBGWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2.2 / 3,
          child: Image.asset(
            Images.imgBGCategories,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2.2 / 3 + 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorsManager.black,
                ColorsManager.black,
                Color(0xFF1D2238).withOpacity(0.13),
              ],
            ),
          ),
        )
      ],
    );
  }
}
