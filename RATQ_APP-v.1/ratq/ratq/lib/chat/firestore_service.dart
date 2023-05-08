import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

const firestoreService = FirestoreService();
class FirestoreService{
  const FirestoreService();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;


  final String chatK = 'chat';
  final String messagesK = 'messages';
  final String timeK = 'time';
  final String chatConvIdK = 'chatConvId';
  final String usersK = 'users';

  Future<String> openChatConv({required String uid, required String otherUID}) async{
    var doc = firestore
        .collection(chatK)
        .doc(); // generate chat-conv-id
    await doc.set({
      usersK : [uid, otherUID],
    });
    log('open new chat conv ${doc.id}');
    return doc.id;
  }

  /// in user, return opened conv-id if it exist
  Future<String?> getChatConvID({required String uid, required String otherUID}) async{
    final st = firestore
        .collection(chatK)
        .where(usersK, arrayContains: uid);

    final docs = (await st
        .get()).docs;

    if(docs.isEmpty){
      log('docs.isEmpty...');
      return null;
    }
    final shared = docs.where((element) => (element.get(usersK) as List).contains(otherUID)).toList();
    if(shared.isEmpty){
      log('shared.isEmpty...');
      return null;
    }

    // in admin, return list of <last-message> to view it in chat-conversations-scr:
    // return MessageModel.fromRes(docs.first.data());
    return shared.first.id;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessages(String convID)=> firestore
      .collection(chatK)
      .doc(convID)
      .collection(messagesK)
      .orderBy(timeK, descending: true)

  // TODO:...
  // .limit(limit)

      .snapshots();

  _updateLastMsg({required String chatConvId, required Map<String, dynamic> messageData}) async => firestore
      .collection(chatK)
      .doc(chatConvId)
      .update(messageData);

  Future<String> sendMessage({required String chatConvId, required Map<String, dynamic> messageData})async{
    final doc = firestore
        .collection(chatK)
        .doc(chatConvId);

    //? Not wait it to not be delay when sending
    _updateLastMsg(
      chatConvId: chatConvId,
      messageData: messageData,
    );

    final messageDoc = doc.collection(messagesK)
        .doc(); // generate message-id

    // send the message
    await messageDoc.set(messageData);
    return messageDoc.id;
  }

  Query<Map<String, dynamic>> getConversations(String uid)=> firestore
      .collection(chatK)
      .where(usersK, arrayContains: uid)
      .orderBy(timeK, descending: true);


}
