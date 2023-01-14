import 'package:flutter/material.dart';
import 'package:flutter_nexle_test/presentation/resources/values.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.onPressedLeading,
  });

  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final Function()? onPressedLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        borderRadius: BorderRadius.circular(300),
        onTap: onPressedLeading,
        child: leading,
      ),
      title: Text(title ?? '', style: Theme.of(context).textTheme.headline1),
      actions: [
        ...actions ?? [],
        const SizedBox(
          width: AppPadding.p24,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
