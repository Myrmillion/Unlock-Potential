import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

class MagnetometerTab extends StatelessWidget {
  const MagnetometerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: magnetometerEventStream(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (magnetometer) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleValueWidget(title: "X", value: magnetometer.x),
            TitleValueWidget(title: "Y", value: magnetometer.y),
            TitleValueWidget(title: "Z", value: magnetometer.z),
          ],
        ),
      ),
    );
  }
}
