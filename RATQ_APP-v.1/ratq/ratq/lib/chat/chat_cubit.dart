import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat/sharedPrefs_helper.dart';
import '../chat/chat_screen.dart';
import '../chat/firestore_service.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates>{

  ChatCubit() : super(ChatInitState());
  static ChatCubit of(BuildContext context) => BlocProvider.of(context);




  String userID = '';
  getUserID() async{
    if(userID.isNotEmpty) return;
    userID = await sharedPrefsHelper.getUid();
    log('userID $userID');
    emit(GetUserIDState());
  }


  String? chatConvID;
  getConvID(String otherUID)async{
    chatConvID = await firestoreService.getChatConvID(
        uid: userID,
        otherUID: otherUID
    )
        ?? await firestoreService.openChatConv(uid: userID, otherUID: otherUID);

    emit(SetChatConvIDState());
  }

  goToChatScr(BuildContext context, String otherUID) async{
    try{
      if(state is SetChatConvIDLoadingState) return;
      chatConvID = null;
      emit(SetChatConvIDLoadingState());

      await getUserID();

      await getConvID(otherUID);

      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
          ChatScreen(
              convID: chatConvID!,
              userID: userID,
              otherID: otherUID
          )
      ));
    }on FirebaseException catch(e){
      log('FirebaseException ${e.message}');
    }
    catch(e){
      log('$e');
    }finally{
      emit(SetChatConvIDState());
    }
  }

  back(){
    chatConvID = null;
    emit(BackState());
  }




  senMessage(String messageTxt) async{
    // await getUserID();
    firestoreService.sendMessage(
        chatConvId: chatConvID!,
        messageData: {
          "text": messageTxt,
          "sender": userID,
          "time": DateTime.now().toUtc()
        }
    );
  }


}
