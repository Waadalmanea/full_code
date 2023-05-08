import 'dart:developer';

import 'package:ratq/chat/chat_cubit.dart';
import 'package:ratq/chat/chat_states.dart';
import 'package:ratq/chat/contacts_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_pagination/firebase_pagination.dart';

import '../chat/firestore_service.dart';
import 'chat_screen.dart';

class ChatConvScr extends StatefulWidget {
  const ChatConvScr({super.key});
  @override
  State<ChatConvScr> createState() => _ChatConvScrState();
}
class _ChatConvScrState extends State<ChatConvScr> {
  @override
  void initState() {
    super.initState();
    if(mounted){
      Future.delayed(const Duration(milliseconds: 700), (){
        ChatCubit.of(context).getUserID();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: const Color(0xffeaece1),
              appBar: AppBar(
                backgroundColor:const Color(0xff8DB792),
                title: const Text('conversation'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                      const ContactsScreen()
                      )),
                      icon: const Icon(Icons.contacts_outlined))
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: FirestorePagination(
                    query: firestoreService.getConversations(
                        ChatCubit.of(context).userID
                    ),
                    limit: 20,
                    isLive: true,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (_, doc, index){
                      final data = doc.data() as Map<String, dynamic>;
                      final users = (data['users'] as List);
                      users.remove(ChatCubit.of(context).userID);

                      return Card(
                        margin: EdgeInsets.zero,
                        child: ListTile(
                            title: Text(users.first),
                            subtitle: Text(data['text'].toString()),
                            trailing: Text((data['time'] as Timestamp).toDate().toLocal().toString(), style: const TextStyle(fontSize: 12)),
                            onTap: () async{
                              print(users.first);
                              await ChatCubit.of(context).goToChatScr(
                                  context,
                                  users.first
                              );
                            }
                        ),
                      );
                    }
                ),
              )
          );
        }
    );
  }
}
