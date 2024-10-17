import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/components/button_agradable.dart';
import 'package:mitchtest/pages/Bad_Emotions.dart';
import 'package:mitchtest/pages/Nice_Emotiions.dart';

class First_home extends StatefulWidget {
  const First_home({super.key});

  @override
  State<First_home> createState() => _First_homeState();
}

class _First_homeState extends State<First_home> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isLoading ? Color(0xff58859A) : Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/mountain.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7
              )
            ),
          ),
          Container(
            color: Color(0xff2A5475).withOpacity(0.3 ),
          ),
          _isLoading ? Center(
            child: CircularProgressIndicator(),
          )
          :SizedBox.shrink(),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(44.0),
                child : Opacity(
    opacity: _isLoading ? 0.5 : 1.0,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: 60,),
    Image.asset('images/sticker.png'),
    Center(child: Text(
    'Tus Emociones Fueron:',
    style: GoogleFonts.quicksand(
    fontSize: 28,
    color: Color(0xffFFFFFF)
    ),)),


                    SizedBox(height: 62,),
                    Center(
                      child: Button_agradable(

                        disabledColor: Color(0xff70879A),
                          texto: 'Agradables',
                          onTop: (texto){
                            if(texto=='Agradables'){
                             setState(() {
                               _isLoading = true;
                             });
                             Future.delayed(Duration (seconds: 1), () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Nice_Emotions()));
                               setState(() {
                                 _isLoading = false;
                               });
                             });
                            };
                          },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: Button_agradable(

                        disabledColor: Color(0xff70879A),
                        texto: 'Desagradables',
                        onTop: (texto){
                          if (texto == 'Desagradables'){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => bad_Emotions()));
                          };
                        },
                      ),
                    )
                  ],
                ),
              ),
              )],
          )
        ],
      ),
    );
  }
}
