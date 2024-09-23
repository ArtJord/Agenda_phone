import 'package:agenda_phone_flutter/model/contato.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:agenda_phone_flutter/outers/validacao.dart';

class CadastrarContato extends StatelessWidget {
  final TextEditingController: controlNome = TextEditingController();
  final TextEditingController controlEmail = TextEditingController();
  final TextEditingController controlTelefone = TextEditingController();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.contacts,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text("Agenda de Contatos"),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 112, 2, 131),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Cadastro de Contato",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Nome",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: controlNome,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Seu nome",
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Email",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: controlEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "exemplo@gmail.com",
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Telefone",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^[0-9()-. ]*$')), //limita os caracteres que podem ser inseridos
              ],
              controller: controlTelefone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "(00) 00000-0000"),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 112, 2, 131),
                      foregroundColor: Colors.white,
                      minimumSize: Size(30, 50)),
                  onPressed: () async {
                    String nome = controlNome.text;
                    String email = controlEmail.text;
                    String telefone = controlTelefone.text;

                    bool nomeExistente = await validaNome(nome);

                    if (!validacao(nome, email, telefone)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Por favor, preencha todos os campos corretamente.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (nomeExistente) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Já existe um contato cadastrado com este nome.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      Contato contato =
                          Contato(nome: nome, telefone: telefone, email: email);
                      Contato.adicionarContato(contato);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Contato adicionado com sucesso!'),
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

