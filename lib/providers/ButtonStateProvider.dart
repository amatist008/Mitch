//crear u porvider en el cual el boton este en escucha si alguien loo presiona
import 'package:flutter/material.dart';
class ButtonStateProvider extends ChangeNotifier{
  bool _isButtonPressed = false;
  bool get isButtonPressed => _isButtonPressed;//la primera es un parametor en la cual esta tendra el acceso de la varibale de tipo boolean

void toggleButton(){
  _isButtonPressed =! _isButtonPressed;//si el boton no esta en falso, invierte el valor
  notifyListeners();
}
}