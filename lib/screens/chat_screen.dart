// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ge2gether_desafio/models/message_model.dart';
import 'package:ge2gether_desafio/models/user_model.dart';
import 'package:ge2gether_desafio/widgets/message_ballon.dart';
import 'package:ge2gether_desafio/widgets/profile_picture.dart';

class ChatScreen extends StatelessWidget {
  //const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //gesture detector no lugar do stack
      body: Stack(
        children: [
          //Definindo o container de trás para ocupar todo o tamanho da tela do aparelho
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple[200],
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              child: Row(
                //appBar design
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilePicture(),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Text(
                            user.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                '${user.age} anos',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              //Status
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                //container branco da frente onde fica as mensagens
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                      child: ListView.builder(
                        reverse: true,
                        itemCount: chats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message message = chats[index];
                          return MessageBallon(
                            message: message,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                //área de input usuário
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    child: Row(
                      children: <Widget>[
                        //icone da esquerda
                        FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: Colors.black.withOpacity(0),
                          child: Icon(
                            Icons.card_giftcard,
                            color: Colors.blue[500],
                            size: 25,
                          ),
                        ),
                        //espaço para usuário digitar
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              minLines: 1,
                              maxLines: 20,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Diga algo...',
                                focusColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        //ícone na direita
                        FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: Colors.black.withOpacity(0),
                          child: Icon(
                            Icons.send,
                            color: Colors.blue[500],
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final user = User(age: 26, name: 'Guilherme');

  List<Message> chats = [
    Message(
        hour: '11:11 AM',
        text:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita'),
    Message(hour: '11:11 AM', text: 'Olá mundo'),
  ];
}
