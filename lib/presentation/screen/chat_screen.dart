import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/core/theme/app_text_style.dart';
import 'package:telegram_clone/presentation/screen/chart_details_screen.dart';

class ChatScreen extends StatefulWidget {
  final Function(bool, Function, bool) onSelectionModeChanged;
  const ChatScreen({super.key, required this.onSelectionModeChanged});

  @override

_ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ValueNotifier<List<Map<String, dynamic>>> chats = ValueNotifier([
    {
      "name": "Alice",
      "message": "Hey! Are you free now?",
      "unread": 2,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },
    {
      "name": "Bob",
      "message": "Let's catch up later.",
      "unread": 0,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 14:30:00")
    },
    {
      "name": "Charlie",
      "message": "How was your trip?",
      "unread": 3,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 08:30:00")
    },
    {
      "name": "David",
      "message": "Meeting at 4 PM, don't forget!",
      "unread": 1,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 21:30:00")
    },

    {
      "name": "Emma",
      "message": "Sent you the notes.",
      "unread": 0,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },
    {
      "name": "John",
      "message": "Check out this meme! 😂",
      "unread": 5,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },
    {
      "name": "Olivia",
      "message": "Are you coming tonight?",
      "unread": 0,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },
    {
      "name": "Sophia",
      "message": "I'll call you in 10 minutes.",
      "unread": 1,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 19:30:00")
    },
    {
      "name": "Liam",
      "message": "I finished the project!",
      "unread": 4,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 13:30:00")
    },
    {
      "name": "Noah",
      "message": "Let's plan for the weekend.",
      "unread": 0,
      "ispinned": true,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },
    {
      "name": "Isabella",
      "message": "Good morning! ☀️",
      "unread": 2,
      "ispinned": false,
      "timestamp": DateTime.parse("2024-03-26 18:30:00")
    },

  ]);


  // void sortChatsByTime() {
  //   chats.value.sort((a, b) => b["timestamp"].compareTo(a["timestamp"]));
  //   chats.notifyListeners(); // Notify the UI to refresh
  // }

void sortChatsByTime() {
  // Separate pinned and unpinned chats
  List<Map<String, dynamic>> pinnedChats = chats.value.where((chat) => chat["ispinned"] == true).toList();
  List<Map<String, dynamic>> unpinnedChats = chats.value.where((chat) => chat["ispinned"] == false).toList();

  // Sort pinned chats by timestamp (latest first)
  // pinnedChats.sort((a, b) => b["timestamp"].compareTo(a["timestamp"]));

  // Sort unpinned chats by timestamp (latest first)
  unpinnedChats.sort((a, b) => b["timestamp"].compareTo(a["timestamp"]));

  // Combine pinned chats on top followed by unpinned chats
  chats.value = [...pinnedChats, ...unpinnedChats];

  // Notify listeners to update the UI
  chats.notifyListeners();
}


  List<Map<String, dynamic>> archived = [];

  ValueNotifier<bool> showArchivedTile = ValueNotifier(false);

  ValueNotifier<Set<int>> selectedChats = ValueNotifier({});
  @override
  void initState() {
    super.initState();
    sortChatsByTime();
    selectedChats.addListener(() {
      bool isActive = selectedChats.value.isNotEmpty;
      log(isActive.toString());
      widget.onSelectionModeChanged(
          isActive, isActive ? pinChats : () {}, false);
    });
  }

  void pinChats() {
    // final List<Map<String, dynamic>> pinnedChats = [];
    // final List<Map<String, dynamic>> unpinnedChats = [];

    for (int i = 0; i < chats.value.length; i++) {
      if (selectedChats.value.contains(i)) {
        if (chats.value[i]["ispinned"] == true) {
          selectedChats.value.remove(i);
          chats.value[i]["ispinned"] = false;
          // unpinnedChats.add(chats.value[i]);
        
        }
        // chats.value[i]["i"]
        else {
          chats.value[i]["ispinned"] = true;
          // pinnedChats.add(chats.value[i]);
          // log(pinnedChats[0]["ispinned"].toString(), name: "ispinned");
  
        } // Move selected chats to top
      }
      //  else {
      //   // unpinnedChats.add(chats.value[i]);
      
      // }
                sortChatsByTime();
    
    }

    // chats.value = [...pinnedChats, ...unpinnedChats]; // Update chat list
    // chats.notifyListeners();
    selectedChats.value = {}; // Clear selection
  }

  void _onLongPress(int index) {
    log("long pressed");
    chats.value[index]["ispinned"] == true
        ? log('true', name: "chat is pinned status")
        : log('false', name: "chat is pinned status");
    selectedChats.value = {
      ...selectedChats.value,
      index
    }; // Add chat to selection
    log(selectedChats.value.toString(), name: 'selectedchats onlong press');
    //  selectedChats.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: showArchivedTile,
        builder: (context, value, child) => ValueListenableBuilder(
            valueListenable: chats,
            builder: (context, value, child) {
              log("k");

              return ListView.builder(
                itemCount:
                    chats.value.length + (showArchivedTile.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (showArchivedTile.value && index == 0) {
                    return _buildArchivedTile();
                  }

                  int chatIndex = showArchivedTile.value ? index - 1 : index;
                  return Dismissible(
                    key: Key(chats.value[chatIndex]["message"]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _archiveChat(chatIndex);
                    },
                    background: _buildSwipeBackground(),
                    child: _buildChatItem(chats.value[chatIndex], index),
                  );
                },
              );
            }),
      ),
    );
  }

  Widget _buildArchivedTile() {
    return ListTile(
      leading: CircleAvatar(
          radius: 7.w,
          child: Icon(Icons.archive, color: AppColors.primaryColor)),
      title: Text("Archived Chats"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArchivedChatScreen(
                  archived: archived, onFunctionCall: _undoArchive,sortChatsByTime: sortChatsByTime)),
        ).then((_) {
          if (archived.isEmpty) showArchivedTile.value = false;
        });
      },
      trailing: Container(
        height: 2.3.h,
        width: 4.5.w,
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

  Widget _buildChatItem(
    Map<String, dynamic> chat,
    int index,
  ) {
    return ValueListenableBuilder(
        valueListenable: selectedChats,
        builder: (context, value, child) {
          log("l");

          return Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onLongPress: () {
                    _onLongPress(index);
            
                  },
                  child: InkWell(
                      onTap: () {
                  
                        Navigator.push(
                            context,
                            (MaterialPageRoute(builder: (context) {
                              return ChatDetailScreen();
                            })));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 7.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat["name"],
                                style: AppTextStyle.readMsgTextStyle(context,
                                    fontSize: 21.sp,
                                    fontColor: AppColors.maintext,
                                    fontWeight: FontWeight.w500),
                              ),
                              chat["unread"] > 0
                                  ? Text(
                                      chat["message"],
                                      style: AppTextStyle.unreadMsgTextStyle(
                                        context,
                                      ),
                                      // TextStyle(
                                      //   color: chat["unread"] > 0 ? Colors.blue : Colors.black87,
                                      //   fontWeight: chat["unread"] > 0 ? FontWeight.bold : FontWeight.normal,
                                      // ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : Row(
                                      spacing: 1.5.w,
                                      children: [
                                        Icon(
                                          Icons.done_all,
                                          color: AppColors.primaryColor,
                                          size: 5.w,
                                        ),
                                        Text(
                                          chat["message"],
                                          style:
                                              AppTextStyle.readMsgTextStyle(
                                                  context,
                                                  fontColor:
                                                      AppColors.chatgrey),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(DateFormat.jm().format(chat["timestamp"])),
                              Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    chats.value[index]["ispinned"] == true
                                        ? Icon(Icons.push_pin_outlined)
                                        : SizedBox(
                                            width: 20,
                                          ),
                                    chat["unread"] > 0
                                        ? Container(
                                            width: 22.3,
                                            // margin: EdgeInsets.only(top: 5),
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                chat["unread"].toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink()
                                  ])
                            ],
                          ),
                        ],
                      ))),
            ),
          );
        });
  }

  Widget _buildSwipeBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.chatgrey,
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
    final archivedChat = chats.value[index];

    archived.add(archivedChat);
    chats.value.removeAt(index);

    showArchivedTile.value = true;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primaryColor,
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
    // setState(() {
    chats.value.add(chat);

    archived.remove(chat);
    if (archived.isEmpty) {
      showArchivedTile.value = false;
    }
    // });
  }
}

class ArchivedChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archived;

  final Function(Map<String, dynamic> chat) onFunctionCall;
  final Function() sortChatsByTime;

  const ArchivedChatScreen(
      {super.key, required this.archived, required this.onFunctionCall, required this.sortChatsByTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Archived Chats",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: archived.isEmpty
          ? Center(
              child: Text(
                "No archived chats",
                style: TextStyle(fontSize: 14.sp, color: AppColors.chatgrey),
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
                        leading: CircleAvatar(radius: 7.w),
                        title: Text(
                          archived[index]["name"],
                          style: AppTextStyle.readMsgTextStyle(context,
                              fontSize: 21.sp,
                              fontColor: AppColors.maintext,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(archived[index]["message"],
                            style: archived[index]["unread"] > 0
                                ? AppTextStyle.unreadMsgTextStyle(context)
                                : AppTextStyle.readMsgTextStyle(context)),
                        trailing: archived[index]["unread"] > 0
                            ? Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  archived[index]["unread"].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.sp),
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
          colors: [
            AppColors.primaryColor,
            AppColors.chatgrey,
          ],
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
    archived[index]["ispinned"] = false;
        final unarchivedChat = archived[index];
        sortChatsByTime();

    archived.removeAt(index);
     
    onFunctionCall(unarchivedChat);
    Navigator.pop(
      context,
    );
       sortChatsByTime();

    // Return chat to main screen

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primaryColor,
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
