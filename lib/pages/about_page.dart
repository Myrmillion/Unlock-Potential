import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('About'),
        automaticallyImplyLeading: true,
      ),
      // Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo.png', height: 200),
            const SizedBox(height: 20.0),
            Text(
              'Unlock Potential',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 50.0),
            const Text(
              'App Version: 0.1.0',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Contact us: unlock@potential.com',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () => ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('This app is for academic purposes only.'),
                  ),
                ),
              child: const Text(
                'Terms of Use',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}