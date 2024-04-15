import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils/decimal_cubit.dart';
import 'package:unlock_potential/utils/utils.dart';
import 'package:unlock_potential/widgets/intrisic_responsive.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

class AccelerometerTab extends StatefulWidget {
  const AccelerometerTab({super.key});

  @override
  State<AccelerometerTab> createState() => _AccelerometerTabState();
}

class _AccelerometerTabState extends State<AccelerometerTab> {
  final raw = accelerometerEventStream().map((e) => [e.x, e.y, e.z]);
  final user = userAccelerometerEventStream().map((e) => [e.x, e.y, e.z]);

  late bool useRaw = true;

  Widget buildSwitcher() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Tooltip(
          message: "Raw = Data right out of the sensor.\n"
              "User = Data after filtering out gravity.",
          triggerMode: TooltipTriggerMode.tap,
          showDuration: Duration(seconds: 5),
          child: Icon(Icons.info_outline),
        ),
        const SizedBox(width: 8.0),
        OutlinedButton(
          onPressed: () => setState(() => useRaw = !useRaw),
          child: Text("Show ${useRaw ? "user" : "raw"} data"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: useRaw ? raw : user,
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (accelerometer) => BlocBuilder<DecimalCubit, int>(
          builder: (_, decimal) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: IntrinsicResponsive(
                children: [
                  buildSwitcher(),
                  const Spacer(),
                  TitleValue(
                    title: "X",
                    value: accelerometer[0].toStringAsFixed(decimal),
                  ),
                  const Spacer(flex: 2),
                  TitleValue(
                    title: "Y",
                    value: accelerometer[1].toStringAsFixed(decimal),
                  ),
                  const Spacer(flex: 2),
                  TitleValue(
                    title: "Z",
                    value: accelerometer[2].toStringAsFixed(decimal),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
