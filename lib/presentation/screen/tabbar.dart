import 'package:flutter/material.dart';
import 'package:telegram_clone/presentation/screen/chat_screen.dart';
import 'package:telegram_clone/presentation/screen/contacts.dart';
import 'package:telegram_clone/presentation/screen/status.dart';


class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar>
    with SingleTickerProviderStateMixin {
        ValueNotifier<bool> islongtapped=ValueNotifier(false);
        void press(bool value){
          islongtapped.value=value;
        }
  late final TabController _tabController;
late final List<Widget> _body ;
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
        _body = [ChatScreen(onLongPress:press ,),Status(),Contacts()];
    // _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actionsPadding: EdgeInsets.only(right: 10,),
       actions: [
  ValueListenableBuilder<bool>(
    valueListenable: islongtapped,
    builder: (context, value, child) {
      return value ? Icon(Icons.push_pin_outlined) : SizedBox.shrink();
    },
  ),SizedBox(width: 5,),
  Icon(Icons.search),Icon(Icons.more_vert),

SizedBox(width: 5,)

        ],
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  height: kToolbarHeight - 8,
                  child: TabBar(labelColor: Colors.white,
                    unselectedLabelStyle: TextStyle(color: Colors.black54),
                    indicatorSize:TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 84, 62, 248),
                  ),
                  // padding: EdgeInsets.all(4),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'chat',
                      ),
                       Tab(text:"status" ,),
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
