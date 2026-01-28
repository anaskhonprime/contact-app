import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = [
    {'김민이': 0},
    {'김용전': 0},
    {'치킨집': 0},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
            setState(() {});
          },
        ),

        appBar: AppBar(
          backgroundColor: Color(0xfff4f4f4),
          title: Text("App"),
          actions: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 250,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Icon(Icons.menu),
                    Icon(Icons.notification_add),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Row(
          children: [
            Flexible(
              flex: 7,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text(name[i].values.first.toString()),
                    title: Text(name[i].keys.first),
                  );
                },
              ),
            ),

            Flexible(
              flex: 3,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        
                      });
                    },
                    child: Text("+"),
                  ),
                  TextButton(onPressed: () {}, child: Text("+")),
                  TextButton(onPressed: () {}, child: Text("+")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
