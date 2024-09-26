import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agenda_phone_flutter/model/contato.dart';
import 'package:agenda_phone_flutter/outers/validacao.dart';

class EditarContato extends StatelessWidget {
  final String nomeAnterior;
  final String emailAnterior;
  final String telefoneAnterior;

  EditarContato({
    required this.nomeAnterior,
    required this.emailAnterior,
    required this.telefoneAnterior
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeControl =
        TextEditingController(text: nomeAnterior);
    TextEditingController emailControl =
        TextEditingController(text: emailAnterior);
    TextEditingController telefoneControl =
        TextEditingController(text: telefoneAnterior);

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

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 6.0),
            Text("Agenda telefonica"),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(  
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Align(
              alignment: Alignment.topCenter,

              child: buildUserIcon(), 
            ),
              Text(
                'Editar Contato',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: nomeControl,
                decoration: InputDecoration(
                    labelText: 'Nome', labelStyle: TextStyle(fontSize: 20)),
              ),
              TextField(
                controller: emailControl,
                decoration: InputDecoration(
                    labelText: 'Email', labelStyle: TextStyle(fontSize: 20)),
              ),
              TextField(
                controller: telefoneControl,
                decoration: InputDecoration(
                    labelText: 'Telefone', labelStyle: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmar'),
                            content: Text(
                                'Deseja deletar esse contato?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Contato.excluirContatoPorNome(nomeAnterior);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Contato deletado com sucesso!'),
                                  ));
                                  Navigator.of(context).pop();
                                  Navigator.pop(context);
                                },
                                child: Text('Deletar'),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Deletar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: Size(30, 50)),
                  ),
                  SizedBox(width: 30.0),
                  ElevatedButton(
                    onPressed: () async {
                      String novoNome = nomeControl.text;
                      String novoEmail = emailControl.text;
                      String novoTelefone = telefoneControl.text;

                      bool nomeJaExiste = await validaNome(novoNome);
                      bool alterouNome = novoNome != nomeAnterior;
                      bool informacoesValidas =
                          validacao
                          (novoNome, novoEmail, novoTelefone);
                      if (!alterouNome) {
                        nomeJaExiste = false;
                      }

                      print(informacoesValidas);
                      if (!informacoesValidas || nomeJaExiste) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Informações inválidas ou existentes.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmação'),
                              content: Text(
                                  'Salvar as alterações?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Contato contato = Contato(
                                        nome: novoNome,
                                        email: novoEmail,
                                        telefone: novoTelefone);
                                    Contato.alterarContato(nomeAnterior, contato);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Contato alterado!'),
                                    ));
                                    Navigator.of(context).pop();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Confirmar'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Salvar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: Size(30, 50)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  }