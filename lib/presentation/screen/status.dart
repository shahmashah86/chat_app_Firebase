import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key});

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
                  CircleAvatar(
                      radius: 39,
                      backgroundColor: const Color.fromARGB(255, 84, 62, 248),
                      child: CircleAvatar(
                        radius: 37,
                      )),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Riya"),
                          Text("3 minutes ago")
                        ],
                      )
                ],
                
              ),
            ),
          );
        });
  }
}
