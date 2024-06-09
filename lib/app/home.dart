import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add , size: 40,),
        ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset("asset/images/note.png" ,
                      width: 100,
                       height: 100,
                       fit: BoxFit.fill,
                       ),
                      ),
                
                     const Expanded(
                      flex: 2,
                      child: ListTile(
                        
                        title: Text("Address" , style: TextStyle(fontSize: 20),),
                        subtitle: Text("SubTitle", style: TextStyle(fontSize: 18),),
                      ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}