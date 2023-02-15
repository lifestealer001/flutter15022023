import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController controller = TextEditingController();
  List<Widget> ls = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffix: IconButton(
                    onPressed: () {
                      ls.add(ListTile(
                        title: Text(controller.text),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete)),
                      ));
                      setState(() {
                        
                      });
                    },
                    icon: Icon(Icons.add))),
          )),
          Expanded(
              flex: 10,
              child: ListView(
                children: ls,
              )),
        ],
      )),
    );
  }
}
