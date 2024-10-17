import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../expanded-Widget/ExpandableText.dart';

class Conscientes extends StatefulWidget {
  const Conscientes({super.key});

  @override
  State<Conscientes> createState() => _ConscientesState();
}

class _ConscientesState extends State<Conscientes> {


  String _description = '''Para qué sirve la conciencia emocional??

Existen amplias diversidades de emociones, y cada una de ellas puede variar en intensidad dependiendo de lo que lo provoque. Conocer de dónde vienen y que nos quieren transmitir es la clave para responder adecuadamente al entorno y tomar mejores decisiones.

Si tenemos una mayor conciencia de nuestras emociones, podremos defendernos mejor de aquello que no nos agrada, es decir, responder asertivamente en lugar de reprimirse o dejarse llevar, conllevando un perjuicio en nuestra salud, calidad de vida o autoestima.
  ''';

  String _description2 = '''La Conciencia De Uno Mismo 

La conciencia de uno mismo es fundamental para responder adecuadamente ante las demandas del entorno. Conocer nuestros puntos fuertes y débiles nos ayudaran a saber cuando necesitamos ayuda y cuando no, y lo más importante de todo, nos ayudará a establecer objetivos realistas y tomar mejores decisiones.

Si no nos conocemos realmente, si nos sobrevaloramos o infravaloramos, o si no ajustamos nuestros objetivos a nuestras capacidades, seremos demasiado ambiciosos o seremos demasiado conformistas.

Ser consciente de uno mismo implica darse cuenta de quién soy, cómo me relaciono con el entorno y porque hago lo que hago, permitiendo aceptarme a mí mismo.

Todas las personas tienen virtudes y defectos, comprender estos conceptos te ayudará a mejorar aquello que peor se te de o más dificultades tienen para desarrollar, y aprovechar tu potencial y las ventajas de las cosas que se te den mejor.

''';



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
                children:<Widget> [
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Ser Conscientes',
                          textStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffE1ECF5).withOpacity(0.7),
                          ),
                          speed: Duration(milliseconds: 150)
                        )
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(milliseconds: 500),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Image.asset('images/concientes-modified.png'),
                  SizedBox(height: 20,),
                  Center(child: Text(
                    '''Es la capacidad de percibir las propias emociones, es decir, el autoconocimiento de lo que sentimos. 

Conocer y controlar las emociones es imprescindible para poder llevar una vida satisfactoria. 

Si no hiciéramos caso de nuestras emociones, tomaríamos decisiones erróneas continuamente, de ahí la importancia de reconocerlas, para después gestionarlas adecuadamente.

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
