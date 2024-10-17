import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/components/my_time_line.dart';
import 'package:mitchtest/lessons-pages/anxiety.dart';
import 'package:mitchtest/lessons-pages/conscientes.dart';
import 'package:mitchtest/lessons-pages/shame.dart';
import '../lessons-pages/pensamientos.dart';
import 'home.dart'; // Asegúrate de importar la página Home

class LessonsPage extends StatefulWidget {
  const LessonsPage({Key? key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(), // Navega a Home()
      ),
    );
  }

  void primeraRuta() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pensamientos(), // Navega a Pensamientos
      ),
    );
  }

  void segundaRuta() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Anxiety(), // Navega a Anxiety
      ),
    );
  }

  void terceraRuta() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Shame(), // Navega a Shame
      ),
    );
  }

  void cuartaRuta() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Conscientes(), // Navega a Conscientes
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mar.jpg'),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Color(0xff0F3D56).withOpacity(0.5),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    'Aprende Sobre Las Emociones',
                    style: GoogleFonts.roboto(
                      fontSize: 35,
                      color: Color(0xffD4E0EA),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff2A4E61).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () => primeraRuta(),
                          child: TimeLine(
                            isFirst: true,
                            isLast: false,
                            isThird: false,
                            isPast: true,
                            eventCard: Text(
                              'Las emociones y los pensamientos son iguales?',
                              style: GoogleFonts.roboto(
                                color: Color(0xffDFE7EC).withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => segundaRuta(),
                          child: TimeLine(
                            isFirst: false,
                            isLast: false,
                            isThird: false,
                            isPast: true,
                            eventCard: Text(
                              'Vivir con ansiedad',
                              style: GoogleFonts.roboto(
                                color: Color(0xffDFE7EC).withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => terceraRuta(),
                          child: TimeLine(
                            isFirst: false,
                            isLast: false,
                            isThird: false,
                            isPast: true,
                            eventCard: Text(
                              'Sentimiento de culpa',
                              style: GoogleFonts.roboto(
                                color: Color(0xffDFE7EC).withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => cuartaRuta(),
                          child: TimeLine(
                            isFirst: false,
                            isLast: true,
                            isThird: false,
                            isPast: true,
                            eventCard: Text(
                              'Ser conscientes de nuestras emociones',
                              style: GoogleFonts.roboto(
                                color: Color(0xffD4E0EA).withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
