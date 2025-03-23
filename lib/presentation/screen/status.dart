import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';

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
              child: Row(spacing: 3.5.w,
                children: [
                  CircleAvatar(
                      radius: 8.6.w,
                      backgroundColor: AppColors.primaryColor,
                      child: CircleAvatar(
                        radius: 8.w,
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
