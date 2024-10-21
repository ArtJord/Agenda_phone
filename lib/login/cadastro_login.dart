import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agenda_phone_flutter/login/tle_login.dart';
import 'tle_login.dart';

class User {
  final String name;
  final String email;
  final String password;

  const User({
    required this.name,
    required this.email,
    required this.password,
  });
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  List<User> users = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image(
          image: NetworkImage(
              "https://pt.wallpapers.com/fundo/fundo-de-gradiente-roxo-1920-x-1080-d0204pizeya0jjn5.html"),
          width: 140,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.pinkAccent
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              "Crie sua conta",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            CupertinoTextField(
              controller: _nameController,
              padding: EdgeInsets.all(15),
              placeholder: "Digite seu nome",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _emailController,
              padding: EdgeInsets.all(15),
              placeholder: "Digite seu e-mail",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
              padding: EdgeInsets.all(15),
              placeholder: "Digite sua senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.greenAccent,
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  users.add(User(name: name, email: email, password: password));

                  
                  _nameController.clear();
             

                  
                  users.add(User(name: name, email: email, password: password));

                  
                  _nameController.clear();
                  _emailController.clear();
                  _passwordController.clear();

                  
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Cadastro realizado com sucesso!'),
                        content: Text('Agora você pode fazer login.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              
                              Navigator.pushNamed(context, '/tle_login'); 
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}