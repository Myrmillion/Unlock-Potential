import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlock_potential/utils/theme_cubit.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Important: No padding from ListView.
              children: [
                DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/logo.png", height: 72.0),
                      const Spacer(flex: 2),
                      Text(
                        'Unlock Potential',
                        style: textTheme.titleLarge,
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.device_unknown),
                  title: const Text('Device'),
                  onTap: () => Navigator.popAndPushNamed(context, '/device'),
                ),
                ListTile(
                  leading: const Icon(Icons.sensors),
                  title: const Text('Sensors'),
                  onTap: () => Navigator.popAndPushNamed(context, '/sensors'),
                ),
                ListTile(
                  leading: const Icon(Icons.battery_unknown),
                  title: const Text('Battery'),
                  onTap: () => Navigator.popAndPushNamed(context, '/battery'),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () => Navigator.popAndPushNamed(context, '/about'),
                ),
              ),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (_, state) {
                  if (state is ThemeDefined) {
                    return IconButton(
                      icon: Icon(
                        state.isDark ? Icons.light_mode : Icons.dark_mode,
                      ),
                      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          const SizedBox(height: 7.5),
        ],
      ),
    );
  }
}
