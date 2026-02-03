import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermisson() async {
    var status = await Permission.contacts.status;

    if(status.isGranted){
      print("Granted");

      // Get all contacts (fully fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();
      contacts = await FlutterContacts.getContacts(
          withProperties: true);

      setState(() {
        name = contacts;
      });

      print(contacts);

    } else if(status.isDenied){
      print("Denied");
    }
  }

  var a = 1;
  var name = [];
  var scores = [0, 0, 0];
  var newUser = '';

  addUser(a) {
    setState(() {
      name.add(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogUI(newUser: newUser, addUser: addUser);
            },
          );
        },
      ),

      appBar: AppBar(
        backgroundColor: Color(0xfff4f4f4),
        title: Text("Contact App"),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 250,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Icon(Icons.menu),
                  IconButton(onPressed: (){
                    getPermisson();
                  }, icon: Icon(Icons.contacts)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text(name[i].displayName),
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.newUser, this.addUser});
  final addUser;
  final newUser;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Contant App"),
      content: TextField(
        controller: inputData,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(border: UnderlineInputBorder()),
      ),
      actions: [
        TextButton(
          onPressed: () {     
            addUser(inputData.text);
            Navigator.pop(context);
          },
          child: Text("OK"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
