import 'package:ar_practice/pages/debug_options_widget.dart';
import 'package:ar_practice/pages/local_ar_screen.dart';
import 'package:ar_practice/pages/object_gestures_screen.dart';
import 'package:ar_practice/pages/screenshot_widget.dart';
import 'package:ar_practice/pages/web_ar_screen.dart';
import 'package:flutter/material.dart';

import 'pages/objects_on_planes_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Practice'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Local Model'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocalARScreen()),
                ),
              ),
              ListTile(
                title: const Text('Web Model'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WebARScreen()),
                ),
              ),
              ListTile(
                title: const Text('Drag and Drop Local Model'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ObjectGesturesScreen()),
                ),
              ),
              ListTile(
                title: const Text('Objects On Planes'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ObjectsOnPlanesWidget()),
                ),
              ),
              ListTile(
                title: const Text('Screenshot'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenshotWidget()),
                ),
              ),
              ListTile(
                title: const Text('Debug Options Widget'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DebugOptionsWidget()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
