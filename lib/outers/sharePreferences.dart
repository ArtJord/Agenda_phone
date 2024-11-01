import 'package:agenda_phone_flutter/controller/usuarioController.dart';
import 'package:agenda_phone_flutter/model/Usuario.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:agenda_phone_flutter/model/Contato.dart';
import 'package:agenda_phone_flutter/controller/contatoController.dart';

final FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<String?> _getNomeUsuario() async {
  return await secureStorage.read(key: 'nomeUsuario'); 
}

Future<int> recuperandoIdUsuario() async {
  String? nomeUsuario = await _getNomeUsuario();
  
  if (nomeUsuario != null) {
    UsuarioController usuarioController = UsuarioController(); 
    Usuario? usuario = await usuarioController.buscaUsuarioPorNome(nomeUsuario); 
    if (usuario != null && usuario.id != null) {
      return usuario.id!; 
    } else {
      return 0; 
    }
  } else {
    return 0; 
  }
}
