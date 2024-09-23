import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Contato {
  String my_nome;
  String my_telefone;
  String my_email;

  Contato({
    required String nome,
    required String telefone,
    required String email,
  }) : my_nome = nome,
       my_telefone = telefone,
       my_email = email;

        String get nome => my_nome;
        String get telefone => my_telefone;
        String get email => my_email;

  set nome(String value) {
    my_nome = value;
  }

  set telefone(String value) {
    my_telefone = value;
  }

  set email(String value) {
    my_email = value;
  }

  @override
  String toString() => 'nome: $my_nome, telefone: $my_telefone, email: $my_email';

  Map<String, dynamic> toJson() {
    return {
      'nome':my_nome,
      'telefone': my_telefone,
      'email': my_email,
    };
  }

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
    );
  }

  static Future<List<Contato>> carregarContatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? contatosJson = prefs.getStringList('contatos');

    if (contatosJson != null) {
      return contatosJson.map((contatoJson) {
        return Contato.fromJson(jsonDecode(contatoJson));
      }).toList();
    } else {
      return [];
    }
  }

  static Future<void> adicionarContato(Contato novoContato) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Contato> contatos = await carregarContatos();

    contatos.add(novoContato);

    contatos.sort((a, b) => a.nome.compareTo(b.nome));

    List<String> contatosJson = contatos.map((contato) {
      return jsonEncode(contato.toJson());
    }).toList();

    await prefs.setStringList('contatos', contatosJson);
  }

   //Modificia o Contato
  static Future<void> alterarContato(
      String nomeAntigo, Contato contatoAtualizado) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<Contato> contatos = await carregarContatos();

      int index = contatos.indexWhere((contato) => contato.nome == nomeAntigo);

      if (index != -1) {
        contatos[index] = contatoAtualizado;

        contatos.sort((a, b) => a.nome.compareTo(b.nome));

        List<String> contatosJson = contatos.map((contato) {
          return jsonEncode(contato.toJson());
        }).toList();

        await prefs.setStringList('contatos', contatosJson);
      } else {
        print('Contato não encontrado com o nome: $nomeAntigo');
      }
    } catch (e) {
      print('Erro ao alterar contato: $e');
    }
  }

       


static Future<Contato?> buscarContatoPorNome(String nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Contato> contatos = await carregarContatos();
}
}
