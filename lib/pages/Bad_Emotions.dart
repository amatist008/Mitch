import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/Portal/Questions-1.dart';
import 'package:mitchtest/components/button_agradable.dart';
class bad_Emotions extends StatefulWidget {

  const bad_Emotions({Key? key});

  @override
  State<bad_Emotions> createState() => _Nice_EmotionsState();
}

class _Nice_EmotionsState extends State<bad_Emotions> {
  List<String> selectedEmotions = [];//almacenar la lista de las emociones seleccionadas

  final List<String> emociones = [
    'TRISTE',
    'DECEPCIONADO',
    'ODIO',
    'DESMOTIVADO',
    'IRA',
    'ANSIEDAD',
    'DEPRESION',
    'ASCO',
    'MIEDO',
    'RENCOR',
    'INTRANQUILIDAD',
    'ENVIDIA',
    'VERGUENZA',
    'ABURRIMIENTO',
    'APATIA',
    'FRUSTACION',
    'CANSANCIO'
  ];

  late List<bool> isSelected =
  List<bool>.generate(emociones.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D4773).withOpacity(0.7),
      body: Stack(
       children: [
         Container(
           decoration: BoxDecoration(
             image:  DecorationImage(
               image: AssetImage('images/mar.jpg'),
               fit: BoxFit.cover,
               opacity: 0.7,
             )
           ),
           child: Column(
             children: [
               SizedBox(
                 height: 100,
               ),
               Padding(
                 padding: EdgeInsets.all(20),
                 child: Center(
                   child: Text(
                     'Desagradables',
                     style: GoogleFonts.quicksand(
                       fontWeight: FontWeight.bold,
                       fontSize: 30,
                       color: Colors.white,
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.all(5),
                 child: Center(
                   child: Text(
                     'Especifica mejor tus emociones',
                     style: GoogleFonts.quicksand(
                       fontSize: 17,
                       color: Color(0xffFDF6F6),
                     ),
                   ),
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.all(70),
                   child: ListView.builder(
                     itemCount: emociones.length,
                     itemBuilder: (BuildContext context, int index) {
                       return GestureDetector(
                         onTap: () {
                           setState(() {
                             isSelected[index] = !isSelected[index];
                           });
                         },
                         child: Stack(
                           children: [
                             Container(
                               height: 50,
                               margin: EdgeInsets.all(10),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(40),
                                 color: Color(0xff3D4B62).withOpacity(0.8),
                               ),
                               child: Center(
                                 child: Text(
                                   emociones[index],
                                   style: GoogleFonts.quicksand(
                                     color: Colors.white
                                   ),
                                 ),
                               ),
                             ),
                             if (isSelected[index])
                               Positioned(
                                 top: 0,
                                 right: 0,
                                 child: Icon(
                                   Icons.check_circle,
                                   color: Color(0xff5F79A5),
                                   size: 24,
                                 ),
                               ),
                           ],
                         ),
                       );
                     },
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.all(10),
                 child: Button_agradable(
                   texto: 'Continuar',
                   onTop: (texto) {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => Questions_1()));
                   },
                   enabled: isSelected.where((selected) => selected).toList().length >= 4,
                   disabledColor: Color(0xff52656f),

                 ),
               )
             ],
           ),
         )
       ],
      ),
    );

  }
  void _registerEmotions(List<String> emotions, bool isPleasant){

  }
}
