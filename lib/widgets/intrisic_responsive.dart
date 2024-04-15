import 'package:flutter/material.dart';

/// Similar to [BasicResponsive] but uses [IntrinsicHeight] to constrain the
/// height of the column to the height of the tallest child. Therefore, it
/// allows to include widgets such as [Expanded] and [Spacer] in the children
/// list.\
/// However, the presence of [IntrinsicHeight] makes this widget potentially
/// quite expensive. It is meant to be used for very limited amount of children
/// and only in cases requiring a more complex layout (if [mainAxisAlignment]
/// and [crossAxisAlignment] are enough, then use [BasicResponsive] instead).\
/// See : https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html
class IntrisicResponsive extends StatelessWidget {
  const IntrisicResponsive({
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
      }),
    );
  }
}
