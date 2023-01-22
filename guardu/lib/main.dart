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
  final upperPattern = RegExp(r'^(?=.*[A-Z])');
  final lowerPattern = RegExp(r'^(?=.*[a-z])');
  final digitPattern = RegExp(r'^(?=.*[0-9])');
  final oneSpCharPattern = RegExp(r'^(?=.*[!@#\$%^&])');
  final eightCharspattern = RegExp(r'^(?=.{8,})');
  final fourteenCharspattern = RegExp(r'^(?=.{14,})');

  int currentIndex = 1;

  Color _primaryColor = Colors.red;
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
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Icon(
                      Icons.pest_control_sharp,
                      color: _primaryColor,
                      size: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 20.0, color: _primaryColor),
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password here',
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
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          _controller.text.length < 8
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.close, color: _primaryColor),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Smaller than 8 characters.',
                                        style: TextStyle(color: _primaryColor)),
                                  ],
                                )
                              : (_controller.text.length > 15)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.check, color: Colors.green),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Longer than 15 characters.',
                                            style:
                                                TextStyle(color: Colors.green)),
                                      ],
                                    )
                                  : Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.check,
                                              color: Colors.green),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Longer than 8 characters.',
                                              style: TextStyle(
                                                  color: Colors.green)),
                                        ],
                                      ),
                                      (upperPattern.hasMatch(_controller.text))
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.check,
                                                    color: Colors.green),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one uppercase letter.',
                                                    style: TextStyle(
                                                        color: Colors.green)),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.close,
                                                    color: _primaryColor),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one uppercase letter.',
                                                    style: TextStyle(
                                                        color: _primaryColor)),
                                              ],
                                            ),
                                      (lowerPattern.hasMatch(_controller.text))
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.check,
                                                    color: Colors.green),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one lowercase letter.',
                                                    style: TextStyle(
                                                        color: Colors.green)),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.close,
                                                    color: _primaryColor),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one lowercase letter.',
                                                    style: TextStyle(
                                                        color: _primaryColor)),
                                              ],
                                            ),
                                      (digitPattern.hasMatch(_controller.text))
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.check,
                                                    color: Colors.green),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'Password has at least one digit.',
                                                    style: TextStyle(
                                                        color: Colors.green)),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.close,
                                                    color: _primaryColor),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text('At least one digit.',
                                                    style: TextStyle(
                                                        color: _primaryColor)),
                                              ],
                                            ),
                                      (oneSpCharPattern
                                              .hasMatch(_controller.text))
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.check,
                                                    color: Colors.green),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one special character.',
                                                    style: TextStyle(
                                                        color: Colors.green)),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.close,
                                                    color: _primaryColor),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    'At least one special character.',
                                                    style: TextStyle(
                                                        color: _primaryColor)),
                                              ],
                                            ),
                                    ]),
                        ],
                      ),
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
                icon: Icon(Icons.memory, size: 30), label: 'Generator'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shield, size: 30), label: 'Password Tester'),
            BottomNavigationBarItem(
                icon: Icon(Icons.info, size: 30), label: 'Info'),
          ],
          selectedItemColor: _primaryColor,
          elevation: 5.0,
          unselectedItemColor: Colors.grey[700],
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          backgroundColor: Colors.grey[900],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
