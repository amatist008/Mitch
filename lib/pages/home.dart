import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitchtest/Portal/SelectDay.dart';
import 'package:mitchtest/components/button-home.dart';
import 'package:mitchtest/pages/First_home.dart';
import 'package:provider/provider.dart';// Asegúrate de importar el provider

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController controller;
  bool _isLoading = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isLoading ? Color(0xff2A4E61) : Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: _isLoading ? 0.2 : 1.0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mar.jpg'),
                  opacity: 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xff2A4E61).withOpacity(0.7),
          ),
          Padding(
            padding: EdgeInsets.all(34.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Text(
                  'Mitch',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: 30,),
                Image.asset('images/sticker.png'),
                SizedBox(height: 50,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '¿Cómo te sientes?',
                    style: GoogleFonts.gothicA1(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Dar el paso a reconocer nuestras emociones, es el mejor camino a mejorar dia a dia.',
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Spacer(),
                Button(
                  text: 'Empieza',
                  onTap: () {
                    // Cambiamos el día actual a rojo

                    DateTime today = DateTime.now();
                    setState(() {
                      _isLoading = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => First_home())
                      );
                    });
                  },
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: Container(
                width: 210,
                child: LinearProgressIndicator(
                  value: controller.value,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff184A6D)),
                  minHeight: 4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
