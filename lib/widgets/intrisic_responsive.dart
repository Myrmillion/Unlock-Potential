import 'package:flutter/material.dart';

/// Similar to [BasicResponsive] but uses [IntrinsicHeight] to constrain the
/// height of the column to the height of the tallest child. Therefore, it
/// allows to include widgets such as [Expanded] and [Spacer] in the children
/// list.\
/// However, the presence of [IntrinsicHeight] makes this widget potentially
/// quite expensive. It is meant to be used for very limited amount of children
/// and only in cases that require a more complex layout (if [mainAxisAlignment]
/// and [crossAxisAlignment] are enough, DO use [BasicResponsive] instead).\
/// See : https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
class IntrinsicResponsive extends StatelessWidget {
  const IntrinsicResponsive({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      );
    });
  }
}
