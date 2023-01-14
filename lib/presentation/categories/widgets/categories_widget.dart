part of '../categories_view.dart';

class CategoriesWidget extends GetView<CategoriesViewModel> {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = controller.categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}

class CategoryItem extends GetView<CategoriesViewModel> {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onPressedCategory(category.id!),
      child: Obx(() {
        return Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorsManager.white.withOpacity(0.12),
            ),
            borderRadius: BorderRadius.circular(AppRadius.r8),
            gradient: controller.selectedCategories.contains(category.id)
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorsManager.pinkAndPubple,
                      ColorsManager.pink,
                    ],
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            category.name ?? '',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        );
      }),
    );
  }
}
