import 'package:flutter/material.dart';

/// A widget useful to create responsive pages. It is only meant for pages
/// which are originally not designed to be scrollable, but could still endure
/// an overflow (ex. in landscape mode or split screen mode).\
/// If the page is originally designed to be scrollable, then it is much better
/// practice to use a [ListView] or equivalent.\
/// See : https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
class BasicResponsive extends StatelessWidget {
  const BasicResponsive({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.margin,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        );
      }),
    );
  }
}
