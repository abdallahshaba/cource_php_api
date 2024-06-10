import 'package:cource_php_app/components/crud.dart';
import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:cource_php_app/components/valid.dart';
import 'package:cource_php_app/constant/link_api.dart';
import 'package:cource_php_app/main.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  Crud _crud =  Crud();

  GlobalKey<FormState> formstate =GlobalKey<FormState>();
   TextEditingController title =TextEditingController();
   TextEditingController content =TextEditingController();


   addNote() async {
    if (formstate.currentState!.validate()) {
      var response = await _crud.postRequest(linkaddNote, {
      "title" : title.text,
      "content" : content.text,
      "id"   : sharedPreference.getString("id_sharedPreferences")
    });
    if (response['status'] == "Success") {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "home");
    }
    return response;
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              CustomTextField(
                valid: (value) {
                  return validInput(value!, 1, 40);
                },
                hintText: "Title",
                 name: "Title",
                  icon: const Icon(Icons.title_outlined),
                   myController: title
                    ),
                   const SizedBox(height: 20,),
                     CustomTextField(
                valid: (value) {
                  return validInput(value!, 1, 200);
                },
                hintText: "Content",
                 name: "Content",
                  icon: const Icon(Icons.content_copy_outlined),
                   myController: content
                    ),
                    const SizedBox(height: 40,),
                   CustomButtonAuth(text22: "Add", onPressed: ()async{
                   await addNote();
                   }),

                 
            ],
          ),
        ),
      ),
    );
  }
}