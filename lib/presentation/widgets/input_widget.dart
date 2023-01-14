// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_nexle_test/presentation/resources/colors.dart';
import 'package:flutter_nexle_test/presentation/resources/styles.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    required this.title,
    this.controller,
    this.onChangeText,
    this.maxLenght,
    this.obscureText = false,
    this.suffixIcon,
    this.borderColor,
    this.validateText,
    this.validateBorderColor,
    this.validateBorderWidth,
    this.validateTextColor,
    this.focusNode,
  }) : super(key: key);

  final String title;
  final TextEditingController? controller;
  final Function(String? value)? onChangeText;
  final int? maxLenght;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? borderColor;
  final String? validateText;
  final Color? validateTextColor;
  final Color? validateBorderColor;
  final double? validateBorderWidth;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    focusNode: focusNode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller,
                    onChanged: onChangeText,
                    maxLines: 1,
                    enabled: true,
                    obscureText: obscureText,
                    style: Theme.of(context).textTheme.headline2,
                    cursorColor: ColorsManager.pubple,
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      labelText: title,
                      labelStyle: Theme.of(context).textTheme.subtitle2,
                      floatingLabelStyle: Theme.of(context).textTheme.headline5,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              suffixIcon ?? const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: borderColor ?? ColorsManager.pubple,
              ),
              Container(
                height: 1,
                width: validateBorderWidth,
                color: validateBorderColor,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  validateText ?? '',
                  style: getRegularStyle(
                    color: validateTextColor ?? ColorsManager.pubple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
