import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat/chat_cubit.dart';
import '../chat/chat_states.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffeaece1),
        body: BlocBuilder<ChatCubit, ChatStates>(
            builder: (context, state) {
              return Center(
                  child: TextButton(
                    onPressed: () async{
                      await ChatCubit.of(context).goToChatScr(context, 'waad@gmail.com');
                    },
                    child: state is SetChatConvIDLoadingState
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : const Text('waad@gmail.com',),
                  )
              );
            }
        )
    );
  }
}
