import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
   late final TextEditingController _controller;
    //  bool _isTextEntered = false;
     ValueNotifier<bool> _isTextEntered=ValueNotifier(false);

   

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(_textChanges);
     
    super.initState();
  }

  void _textChanges(){
    _isTextEntered.value=_controller.text.isNotEmpty;
  }


    @override
  void dispose() {

    _controller.removeListener(_textChanges);
    _controller.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {"sender": "Alice", "content": "Hello!", "timestamp": "7:30 PM"},
      {
        "sender": "You",
        "content": "Hi Alice, how are you?",
        "timestamp": "7:31 PM"
      },
      {
        "sender": "Alice",
        "content": "I'm good, thanks!",
        "timestamp": "7:32 PM"
      },
    ];
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:const Color.fromARGB(255, 84, 62, 248) ,
        toolbarHeight: 65,
        titleSpacing: 0,
        title: ListTile(
          leading: CircleAvatar(
            radius: 30,
          ),
          title: Text(
            messages[0]['sender'],
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: Text('last seen recently',
              style: TextStyle(color: Colors.white54)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: 
       
        Container(height: double.infinity,width: double.infinity,
        // decoration:
        //  BoxDecoration
        // (gradient: LinearGradient(colors: [Colors.indigo.shade800,Colors.white,],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) => messages[index]['sender'] ==
                            "Alice"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 8, top: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(13),
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13))
                                        ),
                                  child: Row(
                                    spacing: 10,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 7),
                                        child: Text(messages[index]['content']),
                                      ),
                                      Text(
                                        messages[index]['timestamp'],
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        : Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 8, top: 8),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 84, 62, 248),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))
                                  ),
                              child: Row(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: Text(messages[index]['content'],
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                  Text(style: TextStyle(color: Colors.white),
                                    messages[index]['timestamp'],
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _isTextEntered,
                builder: (context, value, child) => 
                 TextField(
                  controller: _controller,
                  minLines: 1, // Starts with a single line
                  maxLines: 7,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.emoji_emotions_outlined),
                      hintText: "Message",
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: _isTextEntered.value?IconButton(onPressed: (){
          
                      }, icon: Icon(Icons.send,color: const Color.fromARGB(255, 84, 62, 248))):
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: 3.14 / .8,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.attach_file)),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.mic_none))
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
     
    );
  }
}
