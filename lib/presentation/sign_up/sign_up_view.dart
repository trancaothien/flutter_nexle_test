import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/presentation/resources/colors.dart';
import 'package:flutter_nexle_test/presentation/resources/images.dart';
import 'package:flutter_nexle_test/presentation/resources/values.dart';
import 'package:flutter_nexle_test/presentation/sign_up/sign_up_view_model.dart';
import 'package:flutter_nexle_test/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_nexle_test/presentation/widgets/input_widget.dart';
import 'package:flutter_nexle_test/presentation/widgets/loading_full_screen_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../app/app_enums.dart';

part 'widgets/sign_up_bg_widget.dart';
part 'widgets/sign_up_form_input_widget.dart';
part 'widgets/term_and_services_widget.dart';
part 'widgets/button_bar_widget.dart';

class SignUpView extends GetView<SignUpViewModel> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.unFocus(context),
      child: LoadingFullScreenWidget(
        child: _buildScreen(),
        loading: controller.loadingSubject,
      ),
    );
  }

  Widget _buildScreen() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppbarWidget(
        leading: Image.asset(
          Images.icArrowLeft,
          color: Colors.white,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SignUpBGWidget(),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: Column(
              children: [
                SignInFormInputWidget(),
                const SizedBox(height: 50),
                TermAndServicesWidget(),
                const SizedBox(height: 30),
                ButtonBarWidget(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
