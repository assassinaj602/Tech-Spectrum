import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:task5/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool Personal = true, professional = false;
  bool suggest = false;
  Stream<QuerySnapshot>? todostream;
  TextEditingController todoControll = TextEditingController();

  getonTheLoad() async {
    todostream =
        await databaseSe().getTask(Personal ? "Personal" : "Professional");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getonTheLoad(); // ✅ Call function in initState to load tasks
  }

  Widget getWork() {
    return Expanded(
      child: StreamBuilder(
        stream: todostream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No tasks available"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot docSnap = snapshot.data!.docs[index];

              return CheckboxListTile(
                activeColor: Colors.orangeAccent.shade400,
                title: Text(docSnap["work"]),
                value: (docSnap["yes"] ?? false), // Ensure it's a boolean
                onChanged: (newValue) async {
                  if (docSnap["Id"] != null) {
                    await databaseSe().tick(
                        docSnap["Id"], Personal ? "Personal" : "Professional");
                    setState(() {});
                  }
                },
                controlAffinity:
                    ListTileControlAffinity.leading, // Placed correctly
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent.shade400,
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Greetings, Mr. John Doe!",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Time to Get Things Done!",
              style: TextStyle(color: Colors.black45),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 50),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white38, Colors.white70, Colors.white12]),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Personal
                          ? Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Personal",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                Personal = true;
                                professional = false;
                                await getonTheLoad();
                                setState(() {});
                              },
                              child: Text(
                                "Personal",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                      professional
                          ? Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Professional",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                Personal = false;
                                professional = true;
                                await getonTheLoad();
                                setState(() {});
                              },
                              child: Text(
                                "Professional",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: 20),
                  getWork(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openBox() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel),
                        ),
                        SizedBox(width: 60.0),
                        Text(
                          "Add Todo Task",
                          style: TextStyle(color: Colors.orangeAccent.shade400),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Add Text"),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                      child: TextField(
                        controller: todoControll,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter the Task",
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        child: GestureDetector(
                          onTap: () {
                            String id = randomAlphaNumeric(10);
                            Map<String, dynamic> userTodo = {
                              "work": todoControll.text,
                              "id": id,
                              "yes": false
                            };
                            if (Personal) {
                              databaseSe().addPersonalTask(userTodo, id);
                            } else if (professional) {
                              databaseSe().addProfessionalTask(userTodo, id);
                            }
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
