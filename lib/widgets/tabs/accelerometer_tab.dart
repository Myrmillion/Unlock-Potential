import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

// TODO 3.0 : Un peu plus complexe que les deux autres capteurs.
//
// La raison est que le plugin sensors_plus fournit deux streams pour l'accéléromètre:
// - Un stream pour les données brutes (raw).
// - Un stream pour les données filtrées (user).
//
// Les données brutes sont les données directement sorties du capteur. Elles
// sont brutes et non filtrées. Elles contiennent donc les données de
// l'accélération de la gravité.
//
// Les données filtrées sont les données après filtrage de la gravité. Elles
// permettent de ne garder que les données de l'accélération de l'appareil.
//
// Dans ce laboratoire, nous allons utiliser un switch pour permettre à
// l'utilisateur de choisir entre les données brutes et les données filtrées.

class AccelerometerTab extends StatefulWidget {
  const AccelerometerTab({super.key});

  @override
  State<AccelerometerTab> createState() => _AccelerometerTabState();
}

class _AccelerometerTabState extends State<AccelerometerTab> {
  // TODO 3.1 : Remplacer ces deux Streams vides avec les streams du plugin
  // sensors_plus dédié à l'accéléromètre (raw et user).
  final raw = Stream.empty().map((e) => [e.x, e.y, e.z]);
  final user = Stream.empty().map((e) => [e.x, e.y, e.z]);

  late bool useRaw = true;

  Widget buildSwitch() {
    return Positioned(
      top: 8.0,
      right: 8.0,
      child: Row(
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
            // TODO 3.2 : Au clic du bouton, inverser la valeur de useRaw, en
            // faisant en sorte que le widget se reconstruise !
            // Hint : Utilisez setState.
            onPressed: () {/* */},
            child: Text("Show ${useRaw ? "user" : "raw"} data"),
          ),
        ],
      ),
    );
  }

  Widget buildData(List<double> data) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TitleValueWidget(title: "X", value: data[0]),
          TitleValueWidget(title: "Y", value: data[1]),
          TitleValueWidget(title: "Z", value: data[2]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // TODO 3.3 : Utilisez l'opérateur ternaire pour choisir le stream à
      // utiliser en fonction de la valeur de useRaw.
      stream: Stream.empty(),
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        builder: (acc) => Stack(children: [buildSwitch(), buildData(acc)]),
      ),
    );
  }
}
