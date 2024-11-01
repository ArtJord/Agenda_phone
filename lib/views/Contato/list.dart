import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agenda_phone_flutter/model/contato.dart';
import 'package:agenda_phone_flutter/views/Contato/cadastro.dart';
import 'package:agenda_phone_flutter/views/Contato/AlterarContato.dart';
import 'package:agenda_phone_flutter/Card/card.dart';
import 'package:agenda_phone_flutter/controller/contatoController.dart';


class Lista extends StatefulWidget {
  @override
  ListaState createState() => ListaState();
}

class ListaState extends State<Lista> {
  List<Contato> contatos = [];
  final contatoController = ContatoController();

  @override
  void initState() {
    super.initState();
    carregarContatos();
  }

   Future<void> carregarContatos() async {
    List<Contato> loadedContatos =
        await contatoController.getContatoOrdemAlfabetica();
    setState(() {
      contatos = loadedContatos;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda Telefônica"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return Card_(
            nome: contato.nome,
            telefone: contato.telefone,
            email: contato.email,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlterarContato(
                    antigoNome: contato.nome,
                    antigoEmail: contato.email,
                    antigoTelefone: contato.telefone,
                  ),
                ),
              ).then((_) {
                carregarContatos();
              });
            },
          );
        },
      ),
      floatingActionButton: Container(
        width: 60.0,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CadastrarContato()),
            ).then((_) {
              carregarContatos();
            });
          },
          child: Icon(
            Icons.add_circle_outline_rounded,
            size: 30,
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
