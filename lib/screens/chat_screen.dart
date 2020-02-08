import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/message_model.dart';
import 'package:flutter_tutorial/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Widget msg = Container(
      width: 250,
      margin: isMe
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3)
          : EdgeInsets.only(left: 0.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0))
            : BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(message.time,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                )),
          ),
          SizedBox(height: 8.0),
          Text(message.text),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: isMe
          ? msg
          : Row(
              children: <Widget>[
                msg,
                message.isLiked
                    ? IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      )
                    : IconButton(
                        color: Colors.blueGrey,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      )
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.user.name),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.photo),
                    ),
                    Expanded(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) {},
                        decoration: InputDecoration.collapsed(
                          hintText: "Send a message...",
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
