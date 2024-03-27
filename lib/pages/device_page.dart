import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unlock_potential/utils.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<Map<String, dynamic>?> getDeviceInfo() async {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return (await deviceInfo.androidInfo).data;
      case TargetPlatform.iOS:
        return (await deviceInfo.iosInfo).data;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Device'),
        automaticallyImplyLeading: true,
      ),
      // Body
      body: FutureBuilder(
        future: getDeviceInfo(),
        builder: (_, snapshot) => Utils.futureBuilding(
          snap: snapshot,
          builder: (data) {
            final info = data!.entries;
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (_, i) {
                final element = info.elementAt(i);
                return ListTile(
                  title: Text(element.key),
                  subtitle: Text("${element.value}"),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ),
      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
