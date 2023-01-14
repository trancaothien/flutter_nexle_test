import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingFullScreenWidget extends StatelessWidget {
  const LoadingFullScreenWidget({
    Key? key,
    required this.loading,
    required this.child,
  }) : super(key: key);

  final Stream<bool> loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      builder: (_, snapshot) {
        bool status = snapshot.data ?? true;
        return Stack(
          children: <Widget>[
            child,
            status
                ? Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.5),
                    child: CupertinoActivityIndicator(),
                  )
                : const SizedBox(),
          ],
        );
      },
      stream: loading,
    );
  }
}
