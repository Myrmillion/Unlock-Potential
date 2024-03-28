import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:unlock_potential/utils.dart';
import 'package:unlock_potential/widgets/title_value_widget.dart';

// TODO 1.0 : L'idée de ce petit laboratoire est de voir comment exploiter les
// différents capteurs du téléphone (accéléromètre, gyroscope et magnétomètre).
//
// Pour ce faire, nous allons utiliser le plugin sensors_plus qui permet de
// grandement simplifier l'accès aux différents capteurs.
//
// Le plugin met à disposition des streams pour chaque capteur. Il suffit de
// s'abonner à ces streams pour obtenir les données des capteurs EN TEMPS RÉEL.
//
// Tout au long de ce laboratoire, nous allons utilisé le widget StreamBuilder
// qui permet de gérer l'utilisation des streams et d'afficher les données en
// fonction de l'état du stream. Ce widget s'occupe également de se désabonner
// du stream lorsque le widget est détruit.
// Voir: https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html
//
// Ce projet "Unlock Potential" va au-delà du cadre de ce laboratoire. Vous
// pouvez le parcourir et vous en inspirer pour vos propres projets.

class GyroscopeTab extends StatelessWidget {
  const GyroscopeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // TODO 1.1 : Remplacer ce Stream vide avec le stream du plugin
      // sensors_plus dédié au Gyroscope.
      stream: const Stream.empty(),
      // TODO 1.2 : Se rendre de le fichier utils pour voir comment fonctionne
      // la fonction streamBuilding.
      builder: (_, snapshot) => Utils.streamBuilding(
        snap: snapshot,
        // TODO 1.3 : Comprendre que le builder permet de construire le widget
        // lorsque le stream est ok et qu'il émet des données.
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
