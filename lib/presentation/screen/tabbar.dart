import 'dart:developer';

// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/presentation/screen/chat_screen.dart';
import 'package:telegram_clone/presentation/screen/contacts.dart';

import 'package:telegram_clone/presentation/screen/settings.dart';
import 'package:telegram_clone/presentation/screen/status.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {

 void togglePin() {
    if (pinChatsCallback != null) {
      pinChatsCallback!(); // Calls ChatScreen's togglePin function
    }
    isPinned.value = !isPinned.value; //Toggle pin state correctly
  }

 
 Function()? pinChatsCallback;
  ValueNotifier<bool> islongtapped = ValueNotifier(false);
   ValueNotifier<bool> isPinned = ValueNotifier(false);
  // void press(bool value) {
    
  //   islongtapped.value = value;
  // }

  late final TabController _tabController;
  late final List<Widget> _body;

   
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _body = [
      
      
    ChatScreen(
      onSelectionModeChanged: (bool mode, Function pinCallback,bool ispinnedValue) {
        islongtapped.value = mode; // Show/hide pin icon
        pinChatsCallback = (mode ? pinCallback : null) as Function()?;
        isPinned.value=ispinnedValue;
        
      },
    ),
    
      Status(),
      Contacts()
    ];
  
  }

  @override
  void dispose() {

    _tabController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(
          right: 10,
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: islongtapped,
            builder: (context, value, child) {
                  return islongtapped.value
                  ? IconButton(
                      icon: Icon(isPinned.value
                          ? Icons.push_pin // Show "pinned" icon if true
                          : Icons.push_pin_outlined), // Otherwise, show "unpin" icon
                      onPressed: togglePin,
                    )
                  : SizedBox.shrink();
            },
          ),
          SizedBox(
            width: 5.w,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          // IconButton(onPressed: (){
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Settings();
                })),
                value: "Option1",
                child: Text("Settings"),
              ),
            ];
          })

          // }, icon: Icon(Icons.more_vert)),

// SizedBox(width: 5,)
        ],
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  height: kToolbarHeight - 8,
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelStyle: TextStyle(color: Colors.black54),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor),
                    // padding: EdgeInsets.all(4),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'chat',
                      ),
                      Tab(
                        text: "status",
                      ),
                      Tab(
                        text: 'contact',
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: _body,
                controller: _tabController,
              ))
            ],
          )),
    );
    
  }
  
  
}
  