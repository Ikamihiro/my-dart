import 'package:cli/classes/base_lista.dart';

void main(List<String> arguments) {
  var lista = Lista<String>();

  lista.addElement('One');
  lista.addElement('Two');
  lista.addElement('Three');
  lista.addElement('Four');

  lista.forEach((element) {
    print('$element');
  });
}
