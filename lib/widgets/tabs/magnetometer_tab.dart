import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils/decimal_cubit.dart';
import 'package:unlock_potential/utils/utils.dart';
import 'package:unlock_potential/widgets/basic_responsive.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

class MagnetometerTab extends StatelessWidget {
  const MagnetometerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: magnetometerEventStream(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (magnetometer) => BlocBuilder<DecimalCubit, int>(
          builder: (_, decimal) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: BasicResponsive(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitleValue(
                    title: "X",
                    value: magnetometer.x.toStringAsFixed(decimal),
                  ),
                  TitleValue(
                    title: "Y",
                    value: magnetometer.y.toStringAsFixed(decimal),
                  ),
                  TitleValue(
                    title: "Z",
                    value: magnetometer.z.toStringAsFixed(decimal),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
