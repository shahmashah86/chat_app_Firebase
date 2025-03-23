import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 3, top: 3),
            child: Container(
              child: Row(spacing: 20,
                children: [
                  Container(height:50,width: 50,
                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.indigo.shade100,borderRadius: BorderRadius.circular(10)
                ),
                         child: index == 0
                          ? Icon(
                              Icons.group,
                              size: 30,
                            )
                          : SizedBox.shrink())
                          , index==0? Text("New Group",style: TextStyle(color: Colors.black,fontSize: 16),):Text("Riya",style: TextStyle(fontSize: 16),)
                ],
                
              ),
            ),
          );
        });
  }
}
