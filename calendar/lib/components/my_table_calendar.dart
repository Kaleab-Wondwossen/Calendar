import 'package:ethiopian_calendar/ethiopian_date_converter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/events.dart';

class MyCalendar extends StatefulWidget {
  final double? height;
  const MyCalendar({super.key, this.height});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  Map<DateTime, List<Events>> evenets = {};
  late DateTime today;
  CalendarFormat _calendarFormat =
      CalendarFormat.month; // Define the initial format
  late final ValueNotifier<List<Events>> selectedEvent;
  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    selectedEvent = ValueNotifier(_getEventsForDay(today));
    selectedEvent.value = _getEventsForDay(today);
  }

  void onDaySelected(DateTime day, DateTime focusedDate) {
    setState(() {
      today = day;
    });
  }

  List<Events> _getEventsForDay(DateTime day) {
    return evenets[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          locale: "en_US",
          rowHeight: widget.height ?? 43,
          headerStyle: const HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
          ),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 222, 174),
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
          eventLoader: _getEventsForDay,
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: onDaySelected,
          availableGestures: AvailableGestures.all,
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 10, 16),
          calendarFormat: _calendarFormat, // Set the initial format
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat =
                  format; // Update the format when the button is pressed
            });
          },
        ),
        Text(
          DateFormat('yyyy-MM-dd')
              .format(EthiopianDateConverter.convertToEthiopianDate(today)),
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
