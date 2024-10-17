import 'package:flutter/material.dart';
import 'package:mitchtest/Portal/SelectDay.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // FRASES DEL DÍA
  Map<DateTime, String> frasesDelDia = {
    DateTime.utc(2024, 10, 16): '"Confia en tu esfuerzo, estas abriendo puertas que aun no ves"',
    DateTime.utc(2024, 10, 17): '"Y bota lo que ya no sirva, bótalo aunque te duela. Preocúpate por ti y disfruta plenamente mientras puedas. Porque lo único seguro es que te mueras."',
    DateTime.utc(2024, 10, 18): '"No necesitas una conversacion para cerrar ciclos"',
    DateTime.utc(2024, 10, 19): '"No juzgues tu proceso, tu ve a tu ritmo y a tu tiempo"',
    // Agrega más frases según las fechas que desees
  };

  @override
  Widget build(BuildContext context) {
    // Obtener la fecha actual pero solo con año, mes y día
    DateTime selectedDay = DateTime.now();
    DateTime formattedDate = DateTime.utc(selectedDay.year, selectedDay.month, selectedDay.day);

    // Verificarsi hay una frase para el día seleccionado
    String fraseDelDia = frasesDelDia[formattedDate] ?? 'No hay frase para hoy';

    print('Fecha seleccionada: $formattedDate');
    print('Frase del día: $fraseDelDia');

    return Scaffold(
      backgroundColor: Color(0xff558397),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mountain.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
            ),
          ),
          // Contenido de la pantalla
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              // Calendario
              TableCalendar(
                rowHeight: 80,
                calendarFormat: _calendarFormat,
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                selectedDayPredicate: (day) => isSameDay(day, formattedDate),
                focusedDay: formattedDate,
                onDaySelected: (day, focusedDay) {
                  Provider.of<SelectedDayProvider>(context, listen: false)
                      .setSelectedDay(day);
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Color(0xffdee8ec),
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left_rounded,
                    color: Color(0xffbdd4df),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xffbdd4df),
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: const Color(0xff597986).withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Color(0xffa5c8d6), // Color del día seleccionado
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: const TextStyle(
                    color: Color(0xff919ca0),
                  ),
                  weekendTextStyle: const TextStyle(
                    color: Color(0xffdbe6ea),
                  ),
                  outsideTextStyle: const TextStyle(
                    color: Color(0xffb0b0b0),
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Color(0xffdee8ec),
                  ),
                  weekendStyle: TextStyle(
                    color: Color(0xffbacacf),
                  ),
                ),
              ),
              SizedBox(height: 70), // Espacio entre el calendario y la frase
              // Frase centrada debajo del calendario
              Container(
                width: 280,
                decoration: BoxDecoration(
                  color: Color(0xff688795).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      fraseDelDia,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
