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
      theme: ThemeData(


      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List todolist =[];
 String singlevalue="";

 addstring(content){
   setState(() {
     singlevalue=content;
   });
 }

 addList(){
   setState(() {
     todolist.add({"value":singlevalue});
   });
 }
 deleteItem(index){
   setState(() {
     todolist.removeAt(index);
   });
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(
          'TODO APP',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20

        ),
      ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child:ListView.builder(
                    itemCount: todolist.length,
                    itemBuilder: (context,index){
                  return Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.blue,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                                flex:80,
                                child: Text(todolist[index]['value'].toString(),

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                )
                            ),
                            Expanded(
                                flex:20,

                                child:CircleAvatar(
                                  radius: 20,
                                    backgroundColor: Colors.cyan[500],
                                    child: TextButton(onPressed:(){
                                      deleteItem(index);
                                    },
                                        child: Icon(Icons.delete,
                                          color: Colors.white,
                                        )
                                    )
                                ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            ),
            Expanded(
                flex: 10,
                child:
                Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: Container(
                          height: 45,
                          child: TextFormField(
                            onChanged: (content){
                              addstring(content);

                            },

                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                                  fillColor: Colors.blue[200],
                                  filled: true,
                                  labelText: 'create New...',
                              labelStyle: TextStyle(
                                color: Colors.cyan[800],
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                        ),
                    ),
                    Expanded(
                        flex: 3,
                        child: SizedBox(width: 5,)),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(onPressed: () {
                          addList();
                        },
                          child: Container(
                            height: 16,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text('ADD')),
                        ),
                    ),
                  ],
                )
                ),
          ],
        ),
      ),
    );
  }
}
