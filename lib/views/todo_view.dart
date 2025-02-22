import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TextEditingController inputTitle = TextEditingController(text: "hello");
  TextEditingController inputDes = TextEditingController(text: "hello2");
  List<Map<String, dynamic>> list = [
    {"title": "hammad", "des": "flutter batch"},
    {"title": "haseeb", "des": "flutter batch"},
    {"title": "muneeb", "des": "flutter batch"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Card(
                shape: const RoundedRectangleBorder(),
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  title: (Text("${list[index]["title"]}",
                      style: const TextStyle(color: Colors.black))),
                  subtitle: (Text("${list[index]["des"]}",
                      style: const TextStyle(color: Colors.black))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            DialogCall(index: index);
                          },
                          child: const Icon(Icons.update)),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            removelist(index);
                          },
                          child: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: IconButton(
        onPressed: () {
          bottomSheetSheet();
        },
        isSelected: true,
        icon: const Icon(Icons.add),
        color: Colors.brown,
      ),
    );
  }

  bottomSheetSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: inputTitle,
                decoration: const InputDecoration(labelText: "Input Data "),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: inputDes,
                decoration:
                    const InputDecoration(labelText: "Input description "),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    print(inputTitle.text);
                    list.add({"title": inputTitle.text, "des": inputDes.text});
                    setState(() {});
                    inputTitle.clear();
                    inputDes.clear();
                    Navigator.pop(context);
                  },
                  label: const Text("add"))
            ],
          ),
        );
      },
    );
  }

  void removelist(int index) {
    list.removeAt(index);
    print("remove $index");
    setState(() {});
  }

  // ignore: non_constant_identifier_names
  void DialogCall({required int index}) {
    TextEditingController editTitle =
        TextEditingController(text: list[index]["title"]);
    TextEditingController editDes =
        TextEditingController(text: list[index]["des"]);

    print("dilaog");

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: editTitle,
                  decoration: const InputDecoration(labelText: "Update Name "),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: editDes,
                  decoration:
                      const InputDecoration(labelText: "Update Description "),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      list[index]["title"] = editTitle.text;
                      list[index]["des"] = editDes.text;
                      setState(() {});
                      editDes.clear();
                      editTitle.clear();
                      Navigator.pop(context);
                    },
                    label: const Text("add")),
              ],
            ),
          ),
        );
      },
    );
  }
}
