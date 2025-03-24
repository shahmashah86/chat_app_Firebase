import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:telegram_clone/presentation/screen/profile_setup_screen.dart';
import 'package:telegram_clone/presentation/screen/signin.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 4.5.h,),
      body: 
          ListView(children: [
          DrawerHeader(decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [CircleAvatar(radius: 8.w,),
            SizedBox(height: 1.2.h,),
          Text("Shahma",style: TextStyle(color: Colors.white),),
          Text("+98 65465555",style: TextStyle(color: Colors.white))],)),
          InkWell(onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context){
            return ProfileSetupScreen();
          })),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(spacing: 10,
                children: [Icon(Icons.person),Text("My Profile")],),
            ),
          ),
            Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.group_outlined),Text("New Group")],),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.person_outline),Text("Contacts")],),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.call_outlined),Text("Calls")],),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.dark_mode_outlined),Text("Theme")],),
              ),
            Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.person_add_alt_1_outlined),Text("Invite Friends")],),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(spacing: 10,
                        children: [Icon(Icons.help_outline),Text("Features")],),
              ),
                InkWell(onTap: (){
                  // signout
                  context.read<AuthenticationBloc>().add(AuthernticationSignOut());
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                    return Login();
                  }),(route)=>false);

                },
                  child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(spacing: 10,
                          children: [Icon(Icons.logout),Text("Signout")],),
                                ),
                ),

              ],),
    );
  }
}