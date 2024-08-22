import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:pie_chart/pie_chart.dart';

class AttendanceDetailsPage extends StatefulWidget {
  const AttendanceDetailsPage({Key? key}) : super(key: key);

  @override
  _AttendanceDetailsPageState createState() => _AttendanceDetailsPageState();
}

class _AttendanceDetailsPageState extends State<AttendanceDetailsPage> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    final events = {
      DateTime(2024, 7, 27): Event('Absent', Colors.orange),
      DateTime(2024, 7, 29): Event('Absent', Colors.orange),
      DateTime(2024, 8, 1): Event('Absent', Colors.orange),
      DateTime(2024, 8, 6): Event('Absent', Colors.orange),
      DateTime(2024, 8, 13): Event('Absent', Colors.orange),
      DateTime(2024, 8, 14): Event('Absent', Colors.orange),
      DateTime(2024, 7, 25): Event('Present', Colors.green),
      DateTime(2024, 7, 26): Event('Present', Colors.green),
      DateTime(2024, 7, 30): Event('Present', Colors.green),
      DateTime(2024, 7, 31): Event('Present', Colors.green),
      DateTime(2024, 8, 2): Event('Present', Colors.green),
      DateTime(2024, 8, 5): Event('Present', Colors.green),
      DateTime(2024, 8, 7): Event('Present', Colors.green),
      DateTime(2024, 8, 8): Event('Present', Colors.green),
      DateTime(2024, 8, 9): Event('Present', Colors.green),
      DateTime(2024, 8, 10): Event('Present', Colors.green),
      DateTime(2024, 7, 18): Event('MED', Colors.blue),
      DateTime(2024, 7, 19): Event('MED', Colors.blue),
      DateTime(2024, 7, 22): Event('MED', Colors.blue),
      DateTime(2024, 7, 23): Event('MED', Colors.blue),
      DateTime(2024, 7, 24): Event('MED', Colors.blue),
      DateTime(2024, 8, 12): Event('MED', Colors.blue),
    };

    return events[day] != null ? [events[day]!] : [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Count the total number of Present (including MED) and Absent events.
    int presentCount = 0;
    int absentCount = 0;

    final events = {
      DateTime(2024, 7, 27): Event('Absent', Colors.orange),
      DateTime(2024, 7, 29): Event('Absent', Colors.orange),
      DateTime(2024, 8, 1): Event('Absent', Colors.orange),
      DateTime(2024, 8, 6): Event('Absent', Colors.orange),
      DateTime(2024, 8, 13): Event('Absent', Colors.orange),
      DateTime(2024, 8, 14): Event('Absent', Colors.orange),
      DateTime(2024, 7, 25): Event('Present', Colors.green),
      DateTime(2024, 7, 26): Event('Present', Colors.green),
      DateTime(2024, 7, 30): Event('Present', Colors.green),
      DateTime(2024, 7, 31): Event('Present', Colors.green),
      DateTime(2024, 8, 2): Event('Present', Colors.green),
      DateTime(2024, 8, 5): Event('Present', Colors.green),
      DateTime(2024, 8, 7): Event('Present', Colors.green),
      DateTime(2024, 8, 8): Event('Present', Colors.green),
      DateTime(2024, 8, 9): Event('Present', Colors.green),
      DateTime(2024, 8, 10): Event('Present', Colors.green),
      DateTime(2024, 7, 18): Event('MED', Colors.blue),
      DateTime(2024, 7, 19): Event('MED', Colors.blue),
      DateTime(2024, 7, 22): Event('MED', Colors.blue),
      DateTime(2024, 7, 23): Event('MED', Colors.blue),
      DateTime(2024, 7, 24): Event('MED', Colors.blue),
      DateTime(2024, 8, 12): Event('MED', Colors.blue),
    };

    events.forEach((date, event) {
      if (event.title == 'Present' || event.title == 'MED') {
        presentCount++;
      } else if (event.title == 'Absent') {
        absentCount++;
      }
    });

    // Update the data map to reflect only Present (combined with MED) and Absent counts
    Map<String, double> dataMap = {
      "Present (including MED)":
          presentCount.toDouble(), // Combined Present and MED
      "Absent": absentCount.toDouble(),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Attendance Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar<Event>(
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: _onDaySelected,
              calendarFormat: CalendarFormat.month,
              firstDay: DateTime.utc(2024, 6, 18),
              lastDay: DateTime.utc(2030, 12, 31),
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekStyle: const DaysOfWeekStyle(
                decoration: BoxDecoration(
                  color: Color.fromARGB(141, 255, 255, 255),
                ),
                weekdayStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                weekendStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(236, 236, 236, 1),
                ),
                titleTextStyle:
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isEmpty) {
                    return null;
                  }

                  final event = events.first as Event;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: event.color,
                    ),
                    width: 5.0,
                    height: 5.0,
                    child: Center(
                      child: Text(
                        event.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  if (day.weekday == DateTime.sunday) {
                    // Sundays date color in red
                    return Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  final events = _getEventsForDay(day);
                  if (events.isNotEmpty) {
                    final event = events.first as Event;
                    return Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: event.color),
                      ),
                    );
                  }

                  return Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4.0), // Reduced gap
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 200),
              child: Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, events, _) {
                    return ListView(
                      children: events
                          .map((event) => ListTile(
                                title: Text(event.toString()),
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Attendance Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              colorList: [
                const Color.fromRGBO(0, 88, 3, 1),
                const Color.fromARGB(255, 247, 0, 0)
              ],
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              centerText: "Attendance",
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final Color color;

  Event(this.title, this.color);

  @override
  String toString() => title;
}
