import 'package:cource_php_app/components/crud.dart';
import 'package:cource_php_app/components/custom_button.dart';
import 'package:cource_php_app/components/custom_text_field.dart';
import 'package:cource_php_app/components/valid.dart';
import 'package:cource_php_app/constant/link_api.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, this.notesData});

    // ignore: prefer_typing_uninitialized_variables
    final notesData;
  @override
  State<EditNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<EditNote> {
Crud _crud = Crud();

GlobalKey<FormState> formstate = GlobalKey<FormState>();

TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();
TextEditingController id = TextEditingController();

editNote ()async{
  if (formstate.currentState!.validate()) {
    var response = await _crud.postRequest(linkeditNote, {
    "title" : title.text,
    "content" : content.text,
    "id" : widget.notesData['notes_id'].toString()
  });
  if (response['status'] == 'Success') {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "home");
    
  }
  return response;    
  }
}

  
  @override
  void initState() {
    title.text = widget.notesData["notes_title"];
    content.text = widget.notesData["notes_content"];
    id.text = widget.notesData["notes_id"];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child:Form(
          key: formstate,
          child: ListView(
              children: [
                CustomTextField(
                  valid: (value) {
                    return validInput(value!, 1, 20);
                  },
                  hintText: 'title',
                   name: "Title",
                    icon: const Icon(Icons.title_outlined),
                     myController: title
                      ),
                     const SizedBox(height: 20,),
                       CustomTextField(
                        valid: (value) {
                    return validInput(value!, 1, 20);
                  },
                  hintText: 'content',
                   name: "Content",
                    icon: const Icon(Icons.content_copy_outlined),
                     myController: content
                      ),
                      const SizedBox(height: 20,),
                       CustomTextField(
                        valid: (value) {
                    return validInput(value!, 1, 1000);
                  },
                  hintText: "Id",
                   name: "Id",
                    icon: const Icon(Icons.person_2_outlined),
                     myController: id
                      ),
          
                     const SizedBox(height: 50,),
          
                     CustomButtonAuth(text22: "Edit", onPressed: ()async{
                      await editNote();
                     })
              ],
            ),
        ),
      ),
    );
  }
}