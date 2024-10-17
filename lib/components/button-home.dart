import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Button({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Color(0xffC6D2DA).withOpacity(0.4),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Empezar', style: TextStyle(color: Color(0xffFFFFFF), fontWeight: FontWeight.bold, fontSize: 14),
            ),
      
            SizedBox(width: 10,),
            //el icon de la flecha 
            
            Icon(
                Icons.arrow_forward_outlined,
              color: Color(0xffFFEFEC),
            )
      
          ],
        ),
      ),
    );
  }
}
