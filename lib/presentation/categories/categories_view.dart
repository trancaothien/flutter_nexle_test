import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/data/model/category_model.dart';
import 'package:flutter_nexle_test/presentation/categories/categories_view_model.dart';
import 'package:flutter_nexle_test/presentation/resources/colors.dart';
import 'package:flutter_nexle_test/presentation/resources/images.dart';
import 'package:flutter_nexle_test/presentation/resources/values.dart';
import 'package:flutter_nexle_test/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_nexle_test/presentation/widgets/loading_full_screen_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

part 'widgets/categories_bg_widget.dart';
part 'widgets/categories_widget.dart';
part 'widgets/categories_header_widget.dart';

class CategoriesView extends GetView<CategoriesViewModel> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingFullScreenWidget(
      loading: controller.loadingSubject,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarWidget(
          leading: Image.asset(
            Images.icArrowLeft,
            color: Colors.white,
          ),
          onPressedLeading: controller.onBackScreen,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: controller.onDone,
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        CategoriesBGWidget(),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              CategoriesHeaderWidget(),
              const SizedBox(height: 20),
              CategoriesWidget(),
            ],
          ),
        )
      ],
    );
  }
}
