import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mitchtest/expanded-Widget/ExpandableText.dart';

class Pensamientos extends StatefulWidget {
  const Pensamientos({super.key});

  @override
  State<Pensamientos> createState() => _PensamientosState();
}

class _PensamientosState extends State<Pensamientos> {
  String _description = '''Para saber de dónde vienen las emociones y los pensamientos, se explicara que es lo que pasa primero por nuestro cerebro para poder entender, más a fondo...
  ''';

  String _description2 = '''¿Cuál es la diferencia entre hipocampo e hipotálamo?...
  ''';

  // Variables para controlar la expansión
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2A4E61),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Emoción Y Pensamiento',
                        textStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: const Color(0xffffffff),
                        ),
                        speed: const Duration(milliseconds: 150),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 500),
                  ),
                ),
                const SizedBox(height: 70),
                Center(
                  child: Image.asset('images/think.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded1 = !_isExpanded1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff88abb2).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpandableText(
                      maxLines: _isExpanded1 ? 40 : 3,
                      minLines: 3,
                      text: _description,
                      textStyle: GoogleFonts.roboto(
                        color: const Color(0xffffffff),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                      key: UniqueKey(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded2 = !_isExpanded2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff88abb2).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpandableText(
                      maxLines: _isExpanded2 ? 50 : 3,
                      minLines: 3,
                      text: _description2,
                      textStyle: GoogleFonts.roboto(
                        color: const Color(0xffffffff),
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                      key: UniqueKey(),
                    ),
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
