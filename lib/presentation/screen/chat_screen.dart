import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/core/theme/app_text_style.dart';
import 'package:telegram_clone/presentation/screen/chart_details_screen.dart';



class ChatScreen extends StatefulWidget {
  final Function(bool) onLongPress;
 ChatScreen({super.key, required this.onLongPress});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<Map<String, dynamic>> chats = [
    {"name": "Alice", "message": "Hey! Are you free now?", "unread": 2},
    {"name": "Bob", "message": "Let's catch up later.", "unread": 0},
    {"name": "Charlie", "message": "How was your trip?", "unread": 3},
    {"name": "David", "message": "Meeting at 4 PM, don't forget!", "unread": 1},
    {"name": "Emma", "message": "Sent you the notes.", "unread": 0},
    {"name": "John", "message": "Check out this meme! 😂", "unread": 5},
    {"name": "Olivia", "message": "Are you coming tonight?", "unread": 0},
    {"name": "Sophia", "message": "I'll call you in 10 minutes.", "unread": 1},
    {"name": "Liam", "message": "I finished the project!", "unread": 4},
    {"name": "Noah", "message": "Let's plan for the weekend.", "unread": 0},
    {"name": "Isabella", "message": "Good morning! ☀️", "unread": 2},
  ];

  List<Map<String, dynamic>> archived = [];
  bool showArchivedTile = false;

  @override
  Widget build(BuildContext context) {
    return
      
        Container(height: double.infinity,width: double.infinity,decoration: BoxDecoration
        (gradient: LinearGradient(colors: [Colors.white,Colors.white,],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),),
          child: ListView.builder(
                itemCount: chats.length + (showArchivedTile ? 1 : 0),
                itemBuilder: (context, index) {
          if (showArchivedTile && index == 0) {
            return _buildArchivedTile();
          }
          
          int chatIndex = showArchivedTile ? index - 1 : index;
          return Dismissible(
            key: Key(chats[chatIndex]["message"]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _archiveChat(chatIndex);
            },
            background: _buildSwipeBackground(),
            child: _buildChatItem(chats[chatIndex]),
          );
                },
              ),
        );
 
  }

  Widget _buildArchivedTile() {
    return ListTile(
      leading:
          CircleAvatar(radius: 27,
            child: Icon(Icons.archive, color:  const Color.fromARGB(255, 84, 62, 248))),
      title: Text("Archived Chats"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArchivedChatScreen(archived: archived,
              
              onFunctionCall: _undoArchive)),
        ).then((_) {
          setState(() {
            if (archived.isEmpty) showArchivedTile = false;
          });
        });
      },
      trailing: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(9),
                bottomRight: Radius.circular(8))),
        child: Center(
            child: Text(
          archived.length.toString(),
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  Widget _buildChatItem(Map<String, dynamic> chat) {
    return Column(
      children: [
        GestureDetector(onLongPress:()=> widget.onLongPress(true),
          child: ListTile(
            onTap: () {
            widget.onLongPress(false);
               Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) {
                  return ChatDetailScreen();
                })));
            },
            leading: CircleAvatar(radius: 27),
            title: Text(
              chat["name"],
              style: AppTextStyle.scrreenmsgTextStyle(context,
                  fontSize: 21.sp,
                  fontColor: AppColors.maintext,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: chat["unread"] > 0
                ? Text(
                    chat["message"],
                    style: AppTextStyle.scrreenmsgTextStyle(context,
                        fontColor: const Color.fromARGB(255, 84, 62, 248)),
                    // TextStyle(
                    //   color: chat["unread"] > 0 ? Colors.blue : Colors.black87,
                    //   fontWeight: chat["unread"] > 0 ? FontWeight.bold : FontWeight.normal,
                    // ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    spacing: 3,
                    children: [
                      Icon(
                        Icons.done_all,
                        color: const Color.fromARGB(255, 84, 62, 248),
                        size: 20,
                      ),
                      Text(
                        chat["message"],
                        style: AppTextStyle.scrreenmsgTextStyle(context,
                            fontColor: AppColors.chatgrey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                chat['unread'] > 0 ? SizedBox.shrink() : Text('7:30 PM'),
                if (chat["unread"] > 0)
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 84, 62, 248),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat["unread"].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
        ),
   
      ],
    );
  }

  Widget _buildSwipeBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 84, 62, 248),
            Colors.black12,
            
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Icon(Icons.archive, color: Colors.white),
    );
  }

  void _archiveChat(int index) {
    final archivedChat = chats[index];

    setState(() {
      archived.add(archivedChat);
      chats.removeAt(index);
      showArchivedTile = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Chat archived"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _undoArchive(archivedChat);
          },
        ),
    
      ),
    );
  }

  void _undoArchive(Map<String, dynamic> chat) {
    setState(() {
      chats.add(chat);
      archived.remove(chat);
      if (archived.isEmpty) {
        showArchivedTile = false;
      }
    });
  }
}

class ArchivedChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archived;
  
 
 final Function(Map<String, dynamic> chat) onFunctionCall;

  const ArchivedChatScreen({super.key, required this.archived,required this.onFunctionCall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archived Chats",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 84, 62, 248),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: archived.isEmpty
          ? Center(
              child: Text(
                "No archived chats",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: archived.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Dismissible(
                      key: Key(archived[index]["message"]),
                      direction: DismissDirection.endToStart,
                      background: _buildSwipeBackgrounds(),
                      onDismissed: (direction) {
                        _unarchiveChat(context, index);
                      },
                      child: ListTile(
                        leading: CircleAvatar(radius: 27),
                        title: Text(
                          archived[index]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          archived[index]["message"],
                          style: AppTextStyle.scrreenmsgTextStyle(context,
                              fontColor: archived[index]["unread"] > 0
                                  ? const Color.fromARGB(255, 84, 62, 248)
                                  : Colors.black54),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: archived[index]["unread"] > 0
                            ? Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 84, 62, 248),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  archived[index]["unread"].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            : null,
                      ),
                    ),
              
                  ],
                );
              },
            ),
    );
  }

  Widget _buildSwipeBackgrounds() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color.fromARGB(255, 84, 62, 248),Colors.black12,],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Icon(Icons.unarchive, color: Colors.white),
    );
  }

  void _unarchiveChat(BuildContext context, int index) {
    final unarchivedChat = archived[index];

    archived.removeAt(index);

    
    onFunctionCall(unarchivedChat);
    Navigator.pop(context,);
    
    // Return chat to main screen

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Chat unarchived"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            archived.insert(index, unarchivedChat);
          },
        ),
       
      ),
    );
  }
}


















    //   drawer:Drawer(
    //   child: ListView(children: [
    //   DrawerHeader(decoration: BoxDecoration(color: Colors.blue.shade300),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [CircleAvatar(radius: 30,),
    //     SizedBox(height: 9,),
    //   Text("Shahma",style: TextStyle(color: Colors.white),),
    //   Text("+98 65465555",style: TextStyle(color: Colors.white))],)),
    //   Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Row(spacing: 10,
    //       children: [Icon(Icons.person),Text("My Profile")],),
    //   ),
    //     Divider(),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.group_outlined),Text("New Group")],),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.person_outline),Text("Contacts")],),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.call_outlined),Text("Calls")],),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.bookmark_border_outlined),Text("Saved Messages")],),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.settings),Text("Settings")],),
    //       ),
    //     Divider(),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.person_add_alt_1_outlined),Text("Invite Friends")],),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Row(spacing: 10,
    //                 children: [Icon(Icons.help_outline),Text("Telegram Features")],),
    //       ),
    // ],),),