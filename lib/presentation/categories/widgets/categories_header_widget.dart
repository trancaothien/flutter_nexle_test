part of '../categories_view.dart';

class CategoriesHeaderWidget extends StatelessWidget {
  const CategoriesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.7 / 3),
        Text(
          'Wellcome to Flutter Test',
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        Text(
          'Please select categories what you would like to see on your feed. You can set this later on Filter.',
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    );
  }
}
