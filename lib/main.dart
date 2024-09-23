import 'package:flutter/material.dart';
import 'package:agenda_phone_flutter/outers/sharePreferences.dart';
import 'package:agenda_phone_flutter/views/list.dart';
import 'package:agenda_phone_flutter/model/contato.dart';

void main() {
  runApp(Agenda());
}

class Agenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
        home: Lista(),
    );
  }
}


