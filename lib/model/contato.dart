class Contato {
  int? id;
  String my_nome;
  String my_telefone;
  String my_email;
  int my_usuarioId;

  Contato({
    this.id,
    required String nome,
    required String telefone,
    required String email,
    required int usuarioId, 
  })  : my_nome = nome,
        my_telefone = telefone,
        my_email = email,
        my_usuarioId = usuarioId; 

  String get nome => my_nome;
  String get telefone => my_telefone;
  String get email => my_email;
  int get usuarioId => my_usuarioId; 

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
  String toString() => 'nome: $my_nome, telefone: $my_telefone, email: $my_email, usuarioId: $my_usuarioId';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': my_nome,
      'telefone': my_telefone,
      'email': my_email,
      'usuarioId': my_usuarioId, 
    };
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      email: map['email'] as String,
      usuarioId: map['usuarioId'] as int,
    );
  }
}

 