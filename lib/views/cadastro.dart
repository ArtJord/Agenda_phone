import 'package:agenda_phone_flutter/model/contato.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:agenda_phone_flutter/outers/validacao.dart';

class CadastrarContato extends StatelessWidget {
final TextEditingController controlNome = TextEditingController();
final TextEditingController controlEmail = TextEditingController();
final TextEditingController controlTelefone = TextEditingController();

 final TextStyle hintTextStyle = TextStyle(
    color: Colors.grey.withOpacity(0.6), 
    fontSize: 16,
  );

Widget buildUserIcon() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.purple,
      child: Icon(
        Icons.person,
        size: 70,
        color: Colors.white,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8.0),
            Text("Agenda de Contatos"),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Align(
              alignment: Alignment.topCenter,

              child: buildUserIcon(), 
            ),
            Center(
              child: Text(
                "Cadastrar um novo contato",
                style: TextStyle(
                  fontSize: 22.0,
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
                hintStyle: hintTextStyle,
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
                hintStyle: hintTextStyle,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Numero de Telefone",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^[0-9()-. ]*$')), 
              ],
              controller: controlTelefone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "(00) 00000-0000",
                  hintStyle: hintTextStyle,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
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
                              'Preencha todos os campos.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else if (nomeExistente) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Contato ja existente.'),
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

