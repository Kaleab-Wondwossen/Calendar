import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  late DateTime today;
  CalendarFormat _calendarFormat = CalendarFormat.month; // Define the initial format

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "en_US",
      rowHeight: 43,
      headerStyle: const HeaderStyle(
        formatButtonVisible: true,
        titleCentered: true,
      ),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 176, 64),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 176, 64),
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        markerDecoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 176, 64),
          shape: BoxShape.circle,
        ),
        markerSize: 10.0,
      ),
      availableGestures: AvailableGestures.all,
      focusedDay: today,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 10, 16),
      calendarFormat: _calendarFormat, // Set the initial format
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format; // Update the format when the button is pressed
        });
      },
    );
  }
}
