import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/core/theme/app_text_style.dart';

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
              child: Row(spacing: 6.w,
                children: [
                  Container(height:5.5.h,width: 12.w,
                    decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.indigo.shade100,borderRadius: BorderRadius.circular(10)
                ),
                         child: index == 0
                          ? Icon(
                              Icons.group,
                              size:7.w,
                            )
                          : SizedBox.shrink())
                          , index==0? Text("New Group",style: AppTextStyle.mainTextStyle(context)):Text("Riya",style: AppTextStyle.mainTextStyle(context,fontColor: AppColors.maintext,fontWeight: FontWeight.normal),)
                ],
                
              ),
            ),
          );
        });
  }
}
