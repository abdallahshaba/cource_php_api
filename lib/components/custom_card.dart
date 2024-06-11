import 'package:cource_php_app/app/model/note_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.onTap, required this.onPressed, required this.noteModel,});

  final NoteModel noteModel;
  final void Function()? onTap;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  
                        Expanded(
                        flex: 2,
                        child: ListTile(
                          trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.delete)),
                          title: Text("${noteModel.notesTitle}" , style: const TextStyle(fontSize: 20),),
                          subtitle: Text("${noteModel.notesContent}", style: const TextStyle(fontSize: 18),),
                        )),

                    ],
                  ),
                ),
    );
  }
}