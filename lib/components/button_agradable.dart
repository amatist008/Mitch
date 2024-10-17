import 'dart:ui';

import 'package:flutter/material.dart';

class Button_agradable extends StatelessWidget {
  final String texto;
  final void Function(String)? onTop;
  final bool enabled;//parametro para dehabilitar el boton
  final Color disabledColor;
  final Color textColor;

  const Button_agradable({
    super.key,
    required this.texto,
    required this.onTop,
    this.enabled = true,
    required this.disabledColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
        if (onTop != null) {
          onTop!(texto);
        }
      }
          : null,//ecesario volver a colocar el ontap osea el atributo nuevamente
      child: Container(
        width: 150,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: enabled ? disabledColor : Color(0xff909090).withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              texto,
              style: TextStyle(
                  color: enabled? textColor : Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 10,),

          ],
        ),
      ),
    );
  }
}
