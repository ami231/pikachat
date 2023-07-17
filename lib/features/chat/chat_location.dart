import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pikachat/features/chat/presentation/pages/chat_page.dart';

class ChatLocation extends BeamLocation<BeamState> {
  ChatLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
      const BeamPage(
          key: ValueKey('chat'),
          title: 'Chat',
          child: ChatPage(),
        ),
    ];
  @override
  List<String> get pathPatterns => ['/chat'];
}