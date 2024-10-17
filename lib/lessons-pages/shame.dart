import 'package:flutter/material.dart';
import 'package:mitchtest/expanded-Widget/ExpandableText.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Shame extends StatefulWidget {
  const Shame({super.key});

  @override
  State<Shame> createState() => _ShameState();
}


class _ShameState extends State<Shame> {

  String _description = '''Conciencia Moral

La conciencia moral es lo que permite a una persona sentir culpa cuando percibe que ha actuado en contra de sus propios principios o valores morales. Si la persona actúa de una manera que considera incorrecta o inmoral, su conciencia moral puede generar un sentimiento de culpa como una forma de autorregulación.

Para juzgar y dirigir las acciones la conciencia se sirve de principios, es decir, de la moral con la que cada persona rige su vida. Estos principios que forman la moral son los que trajo de su hogar, y los que fueron adquiriendo e imponiéndose racional y libremente.
  
  ''';

  String _description2 = '''Conciencia Etica
  
Los principios éticos son los que definen qué se considera moralmente correcto o incorrecto en una sociedad. Cuando una persona infringe estos principios, la conciencia moral puede activarse y generar culpa. Por lo tanto, la ética ofrece los estándares contra los cuales la culpa puede surgir.

Aunque no hay que confundir; La ética en sí misma no causa la culpa, pero si establece el marco dentro de cual la culpa puede surgir. La ética define los principios de lo que se considera correcto y que no. Esta emoción de culpabilidad depende de varios factores como la conciencia moral y la internalización de esos principios éticos.''';



  bool _isExpanded1 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Color(0xff2A4E61),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xffE1ECF5).withOpacity(0.7)),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'La Culpa',
                        textStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xffE1ECF5).withOpacity(0.7),
                        ),
                        speed: Duration(milliseconds: 150),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 500),
                  ),
                ),
                SizedBox(height: 30),
                Center(child: Image.asset('images/eterico.png')),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    '''El sentimiento de culpa, está en general, acompañado de emociones displacenteras como tristeza, angustia, frustración, impotencia o remordimiento, entre otras, y de pensamientos reiterativos e improductivos.

Cuando sentimos culpa,  influye la conciencia moral, es aquella voz en nuestro interior que nos orienta en torno a lo que podemos y no podemos hacer, lo que está bien y lo que está mal.               

Pero... ¿Cómo está relacionada la culpa con la conciencia moral, la ética y las normas morales?                    
                    
                    ''',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Color(0xffE1ECF5).withOpacity(0.7),
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded1 = !_isExpanded1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color(0xff88abb2).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpandableText(
                      maxLines: _isExpanded1 ? 50 : 3,
                      minLines: 3,
                      text: _description,
                      textStyle: GoogleFonts.roboto(
                        color: Color(0xffffffff),
                        fontSize: 17,
                      ),
                      key: UniqueKey(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0xff88abb2).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpandableText(
                    maxLines: _isExpanded1 ? 50 : 3,
                    minLines: 3,
                    text: _description2,
                    textStyle: GoogleFonts.roboto(
                      color: Color(0xffffffff),
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
