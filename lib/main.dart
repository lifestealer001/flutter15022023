import 'package:flutter/foundation.dart';
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
  List<String> ls = [];
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
                      ls.add(controller.text);
                      setState(() {});
                    },
                    icon: Icon(Icons.add))),
          )),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: ls.length,
                  itemBuilder: (contex, index) {
                    return ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(ls[index]),
                        trailing: IconButton(
                            onPressed: () {
                              ls.removeAt(index);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                      );
                  }))
        ],
      )),
    );
  }
}
