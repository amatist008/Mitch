import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mitchtest/expanded-Widget/ExpandableText.dart';
import 'package:google_fonts/google_fonts.dart';

class Anxiety extends StatefulWidget {
  const Anxiety({super.key});

  @override
  State<Anxiety> createState() => _AnxietyState();
}

class _AnxietyState extends State<Anxiety> {
  String _descripcion = '''¿Porque Se Da La Ansiedad?
Las reacciones provocadas por la ansiedad tienen su inicio en los mecanismos cerebrales. 

El cerebro de los seres humanos integra muy bien la información del pasado (recuerdos) con la información del presente (situación) para anticipar y prever el futuro (consecuencias).

La información del pasado o recuerdos está formada por las experiencias vividas ligadas a las emociones y sensaciones corporales que se sintieron en aquella situación. 

Recordar el pasado hace revivir las emociones y sensaciones que se sintieron en aquel momento.
  ''';
  String _descripcion2 = '''
Vivir Con Ansiedad

Los trastornos de ansiedad se caracterizan por presentar un miedo o ansiedad intensa y/o una preocupación excesiva. 

Estos trastornos generan un importante malestar y afectan al funcionamiento habitual de la persona tenga la edad que tenga (ya sea de cara a la relación con la familia o amistades, o en el rendimiento en el colegio o en el trabajo). 

En función de cuál sea el foco principal del miedo y/o la preocupación se habla de un trastorno u otro.
  ''';
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2A4E61),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
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
                        'Ansiedad',
                        textStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xffffffff),
                        ),
                        speed: Duration(milliseconds: 150),
                      )
                    ],
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 500),
                  ),
                ),
                SizedBox(height: 30,),
                Image.asset('images/anxiety.png'),
                SizedBox(height: 40,),
                Center(
                  child: Text(
                    'La ansiedad es una emoción que todo el mundo ha experimentado en algún momento y que ayuda al organismo a prepararse para hacer alguna cosa importante. La ansiedad produce una reacción psicofisiológica de activación intensa del sistema nervioso central y de todo el organismo. Aparece cuando se ha de actuar en una situación que demanda un esfuerzo intenso o sostenido y sirve para activar y hacer frente a una amenaza o peligro que está ocurriendo en el presente o que puede pasar en el futuro.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Color(0xffE1ECF5).withOpacity(0.7),
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color(0xff88abb2).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpandableText(
                      maxLines: _isExpanded ? 50 : 3,
                      minLines: 3,
                      text: _descripcion,
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
                    color: Color(0xff88abb2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpandableText(
                    maxLines: _isExpanded ? 50 : 3,
                    minLines: 3,
                    text: _descripcion2,
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
