import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pikachat/features/contacts/presentation/pages/contacts_page.dart';

class ContactsLocation extends BeamLocation<BeamState> {
  ContactsLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
      const BeamPage(
          key: ValueKey('contacts'),
          title: 'Contacts',
          child: ContactsPage(),
        ),
    ];
  @override
  List<String> get pathPatterns => ['/contacts'];
}