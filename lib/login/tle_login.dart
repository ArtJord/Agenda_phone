import 'package:agenda_phone_flutter/views/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro_login.dart';
import 'package:agenda_phone_flutter/views/list.dart';


class TelaLogin extends StatelessWidget{
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context){
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
            ],
          ),
        ),
        
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text("Digite seus dados abaixo.", style: TextStyle(color: Colors.white,
            ),
           ),
          
          const SizedBox(height: 5,),
          const CupertinoTextField(
            padding: EdgeInsets.all(15),
            placeholder: "Digite seu e-mail",
            placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
           ),

           const SizedBox(height: 5,),
           const CupertinoTextField(
            padding: EdgeInsets.all(15),
            placeholder: "Digite sua senha",
            obscureText: true,
            placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7)
              ),
            ),
           ),

           const SizedBox(height: 30),
           SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: Colors.greenAccent,
              child: const Text(
                "Acessar",
                 style: TextStyle(
                color: Colors.black45, 
                fontSize: 17, 
                fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Lista() ),
                );
              },
            ),
           ),

            const SizedBox(height: 30),
           Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 0.8),
              borderRadius: BorderRadius.circular(7)),
            child: CupertinoButton(
              child: const Text(
                "Crie sua conta",
                 style: TextStyle(
                color: Colors.white, 
                fontSize: 14, 
                fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TelaCadastro()),
                );
              },
            ),
           )
          ],
        ),
      ),
    );
  }
  
}