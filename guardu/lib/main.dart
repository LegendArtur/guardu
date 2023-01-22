import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.red),
      home: MainPage(title: 'GuardU'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  int selectedPage = 1;
  final upperPattern = RegExp(r'^(?=.*[A-Z])');
  final lowerPattern = RegExp(r'^(?=.*[a-z])');
  final digitPattern = RegExp(r'^(?=.*[0-9])');
  final oneSpCharPattern = RegExp(r'^(?=.*[!@#\$%^&])');
  final eightCharspattern = RegExp(r'^(?=.{8,})');
  final fourteenCharspattern = RegExp(r'^(?=.{14,})');

  Color? _primaryColor;
  Icon openLock = Icon(Icons.lock_open);

  @override
  void initState() {
    super.initState();
    _primaryColor = Colors.red;
  }

  bool isSafe(String password) {
    return true;
  }

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
                      color: _primaryColor,
                      size: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20.0, color: _primaryColor),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: _primaryColor),
                      ),
                      onChanged: (text) {
                        setState(() {
                          if (text.isNotEmpty) {
                            _controller.text = text;
                          }

                          if (text.length > 15) {
                            _primaryColor = Colors.green;
                          } else {
                            _primaryColor = Colors.red;
                          }
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.close, color: _primaryColor),
                                  Text(
                                      'Password must be longer than 8 characters.',
                                      style: TextStyle(color: _primaryColor)),
                                ],
                              )
                            : (_controller.text.length > 15)
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.check, color: Colors.green),
                                      Text(
                                          'Password is longer than 15 characters.',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ],
                                  )
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
                                    (upperPattern.hasMatch(_controller.text))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.green),
                                              Text(
                                                  'Password has at least one upperCase letter.',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.red),
                                              Text(
                                                  'Password does not have at least one upperCase letter.',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                    (lowerPattern.hasMatch(_controller.text))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.green),
                                              Text(
                                                  'Password has at least one lowerCase letter.',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.red),
                                              Text(
                                                  'Password does not have at least one lowerCase letter.',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                    (digitPattern.hasMatch(_controller.text))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.green),
                                              Text(
                                                  'Password has at least one digit.',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.red),
                                              Text(
                                                  'Password does not have at least one digit.',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                    (oneSpCharPattern
                                            .hasMatch(_controller.text))
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.green),
                                              Text(
                                                  'Password has at least one special character.',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.red),
                                              Text(
                                                  'Password does not have at least one special character.',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                  ]),
                        _controller.text.isNotEmpty
                            ? ElevatedButton(
                                onPressed: () {
                                  _controller.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.abc,
                                  color: _primaryColor,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.memory, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shield, size: 30), label: 'Inbox'),
            BottomNavigationBarItem(
                icon: Icon(Icons.info, size: 30), label: 'Account'),
          ],
          selectedItemColor: _primaryColor,
          elevation: 5.0,
          unselectedItemColor: Colors.grey[700],
          currentIndex: selectedPage,
          backgroundColor: Colors.grey[900],
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Page Application Page-1"),
      ),
      body: Text("Another Page...!!!!!!"),
    );
  }
}
