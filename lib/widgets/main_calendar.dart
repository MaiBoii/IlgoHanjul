import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ilgohanjul/const/colors.dart';

class MainCalendar extends StatelessWidget{
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context){
    return TableCalendar(
      locale: 'ko_kr',
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) => 
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(), 
      firstDay: DateTime(2000,1,1), 
      lastDay: DateTime(3000,1,1),
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextFormatter: (date, locale) =>
              DateFormat.M(locale).format(date),
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0
        ),
        headerPadding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 10.0),
          leftChevronIcon: const Icon(
            Icons.arrow_left,
            size: 40.0,
          ),
          rightChevronIcon: const Icon(
            Icons.arrow_right,
            size: 40.0,
          ),
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),

        todayTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 18.0
        ),
        selectedDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          )
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: PRIMARY_COLOR
        ),
        )
    );
  }
}