import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget{
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image(
          image: NetworkImage(
            "https://ninelabs.blog/wp-content/uploads/2022/05/Group-1.png"), 
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
           SizedBox(height: 30,),
           CupertinoTextField(
            placeholder: "Digite seu e-mail",
            placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
           )
          ],
      
        ),
      ),
    );
  }
  
}