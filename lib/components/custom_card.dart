import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.subtitle, this.onTap, required this.onPressed,});

  final String title;
  final String subtitle;
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
                          title: Text(title , style: const TextStyle(fontSize: 20),),
                          subtitle: Text(subtitle, style: const TextStyle(fontSize: 18),),
                        )),

                    ],
                  ),
                ),
    );
  }
}