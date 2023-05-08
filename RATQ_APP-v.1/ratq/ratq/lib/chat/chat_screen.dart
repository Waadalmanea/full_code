// ignore_for_file: prefer_const_constructors

import 'package:ratq/chat/chat_states.dart';
import 'package:ratq/chat/chat_conv_scr.dart';
import 'package:ratq/chat/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute='chat_screen';
  final String convID, userID, otherID;

  const ChatScreen({super.key, required this.convID, required this.userID, required this.otherID});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void dispose() {
    if(!mounted){
      ChatCubit.of(context).back();
    }
    super.dispose();
  }


  final messageTextController= TextEditingController();
  final _auth= FirebaseAuth.instance;

  String? messageText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaece1),
      appBar: AppBar(
        title: Text('Chatting Room'),
        titleTextStyle: const TextStyle(color: Color(0xffeaece1),fontWeight: FontWeight.bold,fontSize:20),
        backgroundColor:const Color(0xff8DB792),
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Text(widget.otherID),
        ),
        actions: [
          IconButton(
              onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
              const ChatConvScr()
              )),
              icon: const Icon(Icons.contacts_outlined))
        ],
      ),
      body: SafeArea(child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageStreamBuilder(
            convID: widget.convID,
            userID: widget.userID,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(247, 248, 247, 1),
                  width: 2.0,

                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TextField(
                  controller: messageTextController,
                  onChanged: (value){
                    messageText=value;

                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'Type Something...',
                      border: InputBorder.none
                  ),
                )),
                BlocBuilder<ChatCubit, ChatStates>(
                    builder: (context, state) {
                      return TextButton(onPressed: (){
                        if(messageTextController.text.trim().isEmpty) return;
                        final msg = messageTextController.text.trim();
                        messageTextController.clear();
                        ChatCubit.of(context).senMessage(
                            msg
                        );
                      },
                        child: const Text(
                          'send',
                          style: TextStyle(
                            color: Color.fromARGB(255, 109, 147, 123),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),

                        ) ,);
                    }
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key, required this.userID, required this.convID});
  final String userID, convID;

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getChatMessages(convID),
        builder: (context, snapshot){
          List<MessageLine> messageWidgets=[];

          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 5, 5, 5),),
            );
          }
          final messages=snapshot.data!.docs;
          for( var message in messages){
            final meessageText= message.get('text');
            final messageSender= message.get('sender');

            final messageWidget= MessageLine(sender: messageSender,
              text: meessageText,
              isMe: userID==messageSender,);
            messageWidgets.add(messageWidget);



          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );

        });
  }
}


class MessageLine extends StatelessWidget {
  const MessageLine({this.text, this.sender,required this.isMe, super.key});
  final String? sender;
  final String? text;
  final bool isMe;



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe ? CrossAxisAlignment.end :CrossAxisAlignment.start,
        children: [
          Text('$sender',style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),),
          Material(
            elevation: 5,
            borderRadius: isMe ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ): const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Color(0xff8DB792),
            // Color(0xffeaece1)

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('$text',
                style: TextStyle(fontSize: 15, color: Color(0xFF020202)),
              ),


            ),
          ),
        ],
      ),
    );
  }
}
