import 'package:cource_php_app/app/model/note_model.dart';
import 'package:cource_php_app/app/notes/edit.dart';
import 'package:cource_php_app/components/crud.dart';
import 'package:cource_php_app/components/custom_card.dart';
import 'package:cource_php_app/constant/link_api.dart';
import 'package:cource_php_app/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  
  Crud _crud = Crud();

  getNotes()async {
    var response = await _crud.postRequest(linkviewNote, {
      'id' : sharedPreference.getString("id_sharedPreferences")
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('addnote');
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                sharedPreference.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
        title: const Text("Home"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            FutureBuilder(
                future: getNotes(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                   return ListView.builder(
                   itemCount: snapshot.data['content'].length,
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context, index) {
                     return CustomCard(
                      onPressed: () async {
                        var response = await _crud.postRequest(linkdeleteNote, {
                          "id" : snapshot.data['content'][index]['notes_id']
                        });
                        if (response['status'] == 'Success') {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, 'home');
                          
                        }
                      },
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditNote(notesData: snapshot.data['content'][index] ,)));
                      },
                      noteModel: NoteModel.fromJson(snapshot.data['content'][index])
                   );
                   },
                   );

                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Loading..."),
                    );
                  }
                  return const Center(child: Text("problem..."),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
