import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class CircleAnimation extends StatefulWidget {
  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String displayText = "Listo para comenzar\na hacer este\nejercicio";
  int countdown = 5;
  String message = 'Inhala';
  int breathCount = 0;
  bool breathMessage = true;
  bool showFinalMessage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4 ),
    );

    _animation = Tween<double>(begin: 30.0, end: 150.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        setState(() {
          message = 'Exhala'; // Cambiar a 'Exhala' cuando la animación está completa
        });
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
        setState(() {
          message = 'Inhala'; // Cambiar a 'Inhala' cuando la animación está en su estado inicial
          breathCount++;
        });
        if (breathCount >= 5){
          _controller.stop();
          breathMessage = false;
          Future.delayed(Duration(seconds: 2), (){
            setState(() {
              showFinalMessage = true;//para despues de eso se muestre el mensaje final
            });
          });//necesito que el texto que se muestre en panatalla dure  2s

        }
      }
    });

    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        displayText = ""; //No se va a llenar por ahora porque eso se va a hacer desde el VOID
      });
      startCountdown();
    });


    // Mostrar el texto inicial durante 2 segundos, luego iniciar la cuenta regresiva
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        displayText = "";
      });
      startCountdown();
    });
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 1) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          countdown--;
        });
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D4773),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/aura.jpeg'), // Reemplaza con la ruta de tu imagen
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
          ),
          // CONTENIDO PRINCIPAL
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                displayText.isNotEmpty
                    ? Text(
                  displayText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mPlus2(
                    fontWeight: FontWeight.w300,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                )
                    : (countdown > 0
                    ? Text(
                  countdown.toString(),
                  style: GoogleFonts.mPlus2(
                    fontWeight: FontWeight.w300,
                    fontSize: 48,
                    color: Colors.white,
                  ),
                )
                :showFinalMessage
                  ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                    '''Recuerda que incluso en los momentos más oscuros, siempre hay una luz al final del túnel. 
                    
Eres más fuerte de lo que crees, y cada desafío es una oportunidad para crecer.''',
                                     textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white,
                                    ),
                                   ),
                  )
                :AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.0)
                              ],
                              stops: [0.5, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Container(
                            width: _animation.value,
                            height: _animation.value,
                            decoration: BoxDecoration(
                              color: Color(0xff6586B9).withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          message,
                          style: GoogleFonts.mPlus2(
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
