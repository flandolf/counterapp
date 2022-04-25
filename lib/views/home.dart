// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

bool isChecked = false;
int roundedAmount = 0;
double amountToAdd = 0;
int _counter = 0;

class _CounterState extends State<Counter> {
  final prefs = SharedPreferences.getInstance();

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('counter', _counter);
    });
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Add 1')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter--;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Subtract 1')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                      });
                    },
                    child: Text('Reset')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Slider(
                value: amountToAdd,
                onChanged: (double value) {
                  setState(() {
                    amountToAdd = value;
                    roundedAmount = amountToAdd.round();
                  });
                },
                max: 1000,
                label: amountToAdd.round().toString()),
            Text(
              "$roundedAmount",
              style: TextStyle(fontSize: 33),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter += roundedAmount;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter -= roundedAmount;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Subtract'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter += 3;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Add 3'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter -= 3;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Subtract 3'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter += 4;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Add 4'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _counter -= 4;
                      });
                      if (isChecked) {
                        save();
                      }
                    },
                    child: Text('Subtract 4'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  child: Text('Save'),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    loadCounter();
                  },
                  child: Text('Load'),
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;

                      print('isChecked: $isChecked');
                    });
                    if (isChecked) {
                      print('saved!');
                      save();
                    }
                  },
                ),
                Text('AutoSave?'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Made With ❤ by Andrew",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(
                      "Email: andyy@dumpyy.xyz",
                      style: TextStyle(fontSize: 20),
                    ),
                    Linkify(
                      onOpen: (link) => launchUrl(Uri.parse(link.url)),
                      text: "Github: https://github.com/dumpydev",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              });
        },
        tooltip: 'Info',
        backgroundColor: Colors.blue,
        child: Icon(Icons.info),
      ),
    );
  }
}
