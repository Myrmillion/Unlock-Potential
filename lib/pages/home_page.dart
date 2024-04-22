import 'package:flutter/material.dart';
import 'package:unlock_potential/generated/l10n.dart';
import 'package:unlock_potential/widgets/tailored_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildCard({
    required title,
    required subtitle,
    required String imgPath,
    Function()? onPressed,
  }) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          SizedBox(
            height: 175.0,
            child: Ink.image(image: AssetImage(imgPath), fit: BoxFit.cover),
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: ElevatedButton(
              onPressed: onPressed,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final i10n = S.current;

    return Scaffold(
      // AppBar
      appBar: AppBar(title: Text(i10n.homeTitle)),
      // Drawer
      drawer: const TailoredDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2,
      // Body
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          buildCard(
            title: i10n.deviceTitle,
            subtitle: i10n.deviceSubtitle,
            imgPath: 'assets/img/device.png',
            onPressed: () => Navigator.pushNamed(context, '/device'),
          ),
          buildCard(
            title: i10n.sensorsTitle,
            subtitle: i10n.sensorsSubtitle,
            imgPath: 'assets/img/sensors.png',
            onPressed: () => Navigator.pushNamed(context, '/sensors'),
          ),
          buildCard(
            title: i10n.batteryTitle,
            subtitle: i10n.batterySubtitle,
            imgPath: 'assets/img/battery.jpg',
            onPressed: () => Navigator.pushNamed(context, '/battery'),
          ),
        ],
      ),
    );
  }
}
