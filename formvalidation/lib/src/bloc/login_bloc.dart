import 'dart:async';

class LoginBloc {
  final _emailControler = StreamController<String>.broadcast();
  final _passwordControler = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get emailStream => _emailControler.stream;
  Stream<String> get passwordStream => _emailControler.stream;

  //Insertar valores al Stream
  Function(String) get changeEmail => _emailControler.sink.add;
  Function(String) get changePassword => _passwordControler.sink.add;

  dispose() {
    _emailControler.close();
    _passwordControler.close();
  }
}
