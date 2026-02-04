import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _themeIndex = 0;

  final List<Color> _themes = [
    const Color.fromARGB(255, 1, 48, 87),
    const Color.fromARGB(255, 70, 2, 82),
    const Color.fromARGB(255, 2, 92, 5),
    const Color.fromARGB(255, 198, 119, 0),
  ];

  void _changeTheme() {
    setState(() {
      _themeIndex = (_themeIndex + 1) % _themes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final seed = _themes[_themeIndex];

    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: seed, // ✅ makes the change SUPER obvious
          foregroundColor: const Color.fromARGB(255, 193, 8, 8),
        ),
      ),
      home: HomePage(onThemeChange: _changeTheme),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeChange;

  const HomePage({super.key, required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App PAPA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Beasting!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            _buildHomepage(),

            Text(
              'This is my first modification.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print('Button Clicked!');
              },
              child: Text('Click Me'),
            ),

            ElevatedButton(
              onPressed: () {
                print("button is operational");
                onThemeChange();
              },
              child: Text("Color changer"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomepage() {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.person, size: 50, color: Colors.black),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BIG DAWG',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 151, 149),
                  ),
                ),
                Text(
                  'Major: Money BABY',
                  style: TextStyle(color: Color.fromARGB(255, 220, 13, 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
