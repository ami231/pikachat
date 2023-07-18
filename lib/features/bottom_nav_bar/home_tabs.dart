import 'package:flutter/material.dart';
import 'package:pikachat/features/chat/presentation/pages/chat_page.dart';
import 'package:pikachat/features/contacts/presentation/pages/contacts_page.dart';

enum HomeTabs { chat, contacts }

extension HomeTabExtension on HomeTabs {
  static final tabImagesPath = {
    HomeTabs.chat: Icons.message,
    HomeTabs.contacts: Icons.people_outline_outlined,
  };

  static final tabTitle = {
    HomeTabs.chat: 'Chat',
    HomeTabs.contacts: 'Contacts',
  };

  static final tabRoute = {
    HomeTabs.chat: ChatPage.routeName,
    HomeTabs.contacts: ContactsPage.routeName,
  };

  static final snakeCaseTitle = {
    HomeTabs.chat: '/chat',
    HomeTabs.contacts: '/contacts',
  };

  String getTabTitle() => tabTitle[this]!;

  String getTabRoute() => tabRoute[this]!;

  IconData getImagePath() => tabImagesPath[this]!;

  String getSnakeCaseTitle() => snakeCaseTitle[this]!;
}