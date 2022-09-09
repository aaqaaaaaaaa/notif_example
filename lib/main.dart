import 'package:flutter/material.dart';
import 'package:notif_example/api/notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          NotificationWidget(
            backgroundColor: Colors.blue,
            selected: selected,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async => await NotificationApi.showNotification(
                    title: 'Title',
                    body:
                        'BodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBodyBody',
                    payload: 'Payload',
                  ),
                  child: const Text('Show info'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: const Text('Show success'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Show errror'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.selected,
    required this.backgroundColor,
  }) : super(key: key);

  final bool selected;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(0, selected ? -0.8 : -1.5),
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: const Text('gggggggggggggggg')),
    );
  }
}
