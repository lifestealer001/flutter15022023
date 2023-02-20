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
  int t = 0;
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
              onEditingComplete: () {
                t = int.parse(controller.text);
                for (int i = 0; i < t; i++) 
                ls.add(controller.text);
                setState(() {});
              },
              onSubmitted: (val) {
                print('onsubmitted');
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: ls.length,
                itemBuilder: (contex, index) {
                  return ListTile(
                    leading: Text('${index}'),
                    title: Text(ls[index]),
                    trailing: IconButton(
                        onPressed: () {
                          ls.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  );
                }),
          )
        ],
      )),
    );
  }
}
