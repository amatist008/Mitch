import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/Portal/Questions-3.dart';
import 'package:mitchtest/components/Questions_Button.dart';

class Questions_2 extends StatefulWidget {
  const Questions_2({super.key});

  @override
  State<Questions_2> createState() => _Questions_2State();
}

class _Questions_2State extends State<Questions_2> {
  List<bool> isSelected = List<bool>.filled(5, false); // Adjust the length as needed
  TextEditingController _controller = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      setState(() {
        isTextFieldEmpty = _controller.text.isEmpty;
      });
    });
  }
  
  Route _createRoute(){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation)=> Questions_3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
    },
      transitionDuration: Duration(milliseconds: 800), // Customize the duration here
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D4773),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/aura.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90,),
                  Text(
                    'Que Hiciste En Ese\nMomento?',
                    style: GoogleFonts.mPlus2(
                      fontWeight: FontWeight.w300,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 230,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: 330,
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      decoration: InputDecoration(
                        hintText: 'Escribe',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xff477FBB).withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),// This will push the button towards the bottom
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10), // Adjust bottom padding as needed
                      child: Questions_Button(
                        texto: 'Continuar',
                        onTop: (texto) {
                          Navigator.of(context).push(_createRoute());
                        },
                        enabled: !isTextFieldEmpty,
                        disabledColor: Color(0xffA5B5C0).withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
