import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData(
    primaryColor: Colors.red,
  );

  ThemeNotifier() {
    _themeData = ThemeData(
      primaryColor: Colors.red,
    );
  }

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeNotifier.getTheme(),
      home: const MyHomePage(title: 'asdfasfasdfasdfadsfadsf'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  var mainColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Icon(
                    Icons.pest_control_sharp,
                    color: mainColor,
                    size: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 20.0, color: mainColor),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(fontSize: 20.0, color: mainColor),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _controller.text = text;
                      });
                    },
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _controller.text.length < 8
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.close,
                                    color: Theme.of(context).primaryColor),
                                Text(
                                    'Password must be longer than 8 characters.',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor)),
                              ],
                            )
                          : (_controller.text.length > 15)
                              ? them
                              : Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.check, color: Colors.green),
                                      Text(
                                          'Password is longer than 8 characters.',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
