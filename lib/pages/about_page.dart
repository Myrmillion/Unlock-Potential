import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:unlock_potential/utils/utils.dart';
import 'package:unlock_potential/widgets/basic_responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('About'),
        automaticallyImplyLeading: true,
      ),
      // Body
      body: FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (_, snapshot) => Utils.futureBuilding(
          snap: snapshot,
          builder: (info) {
            return Center(
              child: BasicResponsive(
                margin: const EdgeInsets.all(8.0),
                children: [
                  Image.asset('assets/icon/logo.png', height: 200),
                  const SizedBox(height: 20.0),
                  Text(
                    info.appName,
                    style: textTheme.headlineLarge,
                  ),
                  Text(
                    info.packageName,
                    style: textTheme.labelSmall?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    'App Version: ${info.version}+${info.buildNumber}',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    'Contact us: unlock@potential.com',
                    style: textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () => Utils.simpleSnackBar(
                      context,
                      'This app is for academic purposes only.',
                    ),
                    child: const Text(
                      'Terms of Use',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
