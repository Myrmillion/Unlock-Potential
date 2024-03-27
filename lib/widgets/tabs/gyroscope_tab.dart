import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';

class GyroscopeTab extends StatelessWidget {
  const GyroscopeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return StreamBuilder(
      stream: gyroscopeEventStream(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (gyroscope) => Column(
          children: [
            const Spacer(),
            Text("X", style: textTheme.displayMedium),
            Text("${gyroscope.x}", style: textTheme.headlineMedium),
            const Spacer(),
            Text("Y", style: textTheme.displayMedium),
            Text("${gyroscope.y}", style: textTheme.headlineMedium),
            const Spacer(),
            Text("Z", style: textTheme.displayMedium),
            Text("${gyroscope.z}", style: textTheme.headlineMedium),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
