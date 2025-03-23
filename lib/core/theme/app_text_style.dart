

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';

class AppTextStyle {
    static TextStyle textButtonTextStyle(
    BuildContext context, {
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
  return  TextStyle(color: fontColor??AppColors.bluetext,
    fontSize: 16.sp,
    fontWeight: fontWeight??FontWeight.w500,
    );
  }

    static TextStyle mainTextStyle(
    BuildContext context, {
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
  return  TextStyle(color: fontColor??AppColors.maintext,
    fontSize:fontSize??16.sp,
    fontWeight: fontWeight??FontWeight.w500,
    );
  }


 //homescreen kanuna message blue if not read nd read
 
      static TextStyle unreadMsgTextStyle(
    BuildContext context, {
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
    TextOverflow? overflow
    
  }) {
  return  TextStyle(color: fontColor??AppColors.primaryColor,
    fontSize: 15.sp,
    fontWeight: fontWeight??FontWeight.normal,
    overflow: TextOverflow.ellipsis
    );
  }
   
      static TextStyle readMsgTextStyle(
    BuildContext context, {
    Color? fontColor,
    double? fontSize,
    FontWeight? fontWeight,
    TextOverflow? overflow
    
  }) {
  return  TextStyle(color: fontColor??AppColors.chatgrey,
    fontSize: 15.sp,
    fontWeight: fontWeight??FontWeight.normal,
       overflow: TextOverflow.ellipsis
    );
  }
}