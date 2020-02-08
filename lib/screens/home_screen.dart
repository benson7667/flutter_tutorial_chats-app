import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/message_model.dart';
import 'package:flutter_tutorial/widgets/favourite_contact.dart';
import 'package:flutter_tutorial/widgets/message_category.dart';
import 'package:flutter_tutorial/widgets/recent_chats.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            iconSize: 30.0,
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Chats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              iconSize: 30.0,
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            MessageCategory(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  children: <Widget>[
                    FavouriteContacts(),
                    RecentChats(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
