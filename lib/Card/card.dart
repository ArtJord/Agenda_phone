import 'package:flutter/material.dart';
import 'package:agenda_phone_flutter/Card/card.dart';

class Card_ extends StatelessWidget {
  final String nome;
  final String telefone;
  final String email;
  final IconData icone;
  final VoidCallback onTap; 

  Card_({
    required this.nome,
    required this.telefone,
    required this.email,
    required this.onTap, 
    this.icone = Icons.person,
  });

 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Icon(icone),
              ),
              SizedBox(width: 10),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(height: 8),
                  Text(telefone),
                  SizedBox(height: 4),
                  Text(email),
                ], // <- Corrigido o fechamento do Column
              ),
            ],
          ),
        ),
      ),
    );
  }
}