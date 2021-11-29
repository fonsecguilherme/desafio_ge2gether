// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ge2gether_desafio/models/message_model.dart';

// ignore: must_be_immutable
class MessageBallon extends StatelessWidget {
  Message message;

  MessageBallon({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.fromLTRB(16, 8, 100, 8),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message.text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 20, top: 5),
              child: Text(message.hour),
            ),
          ),
        ],
      ),
    );
  }
}
