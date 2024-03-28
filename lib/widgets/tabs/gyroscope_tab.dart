import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

class GyroscopeTab extends StatelessWidget {
  const GyroscopeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: gyroscopeEventStream(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (gyroscope) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleValueWidget(title: "X", value: gyroscope.x),
            TitleValueWidget(title: "Y", value: gyroscope.y),
            TitleValueWidget(title: "Z", value: gyroscope.z),
          ],
        ),
      ),
    );
  }
}
