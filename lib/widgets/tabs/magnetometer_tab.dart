import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

// TODO 2.0 : Pareil que pour le Gyroscope.

class MagnetometerTab extends StatelessWidget {
  const MagnetometerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // TODO 1.1 : Remplacer ce Stream vide avec le stream du plugin
      // sensors_plus dédié au Magnetomètre.
      stream: const Stream.empty(),
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
