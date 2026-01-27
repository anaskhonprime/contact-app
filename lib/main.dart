import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            )
          ],
          ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black)

          ),
          
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                child: Image.asset('2.jpg'),
              ),
              Container(
                width: 250,
                height: double.infinity,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Text 1", style: TextStyle(fontSize: 30),),
                    Text("Text 2"),
                    Text("Text 3"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_outline),
                        Text("4")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
