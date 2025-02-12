import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_agents_vertex_ai/functionality/app_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    final isDarkMode = themeNotifier.darkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900]?.withOpacity(0.5) : Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode ? Colors.black54 : Colors.grey.shade200,
                  offset: Offset(10, 10),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SwitchListTile(
                    title: const Text(
                      'Super Cool Dark Mode',
                      style: TextStyle(
                        fontFamily: 'FuturisticFont', // Ensure this font is added to your project
                      ),
                    ),
                    value: isDarkMode,
                    onChanged: (bool value) {
                      themeNotifier.toggleDarkMode(value);
                    },
                    secondary: const Icon(Icons.dark_mode),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text(
                      'Made with ❤️',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'FuturisticFont',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
