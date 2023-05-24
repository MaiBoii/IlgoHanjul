import 'package:get_it/get_it.dart';
import 'package:ilgohanjul/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:ilgohanjul/widgets/main_calendar.dart';
import 'package:ilgohanjul/widgets/howmuchread.dart';
import 'package:ilgohanjul/widgets/today_banner.dart';
import 'package:ilgohanjul/widgets/read_input_sheet.dart';
import 'package:ilgohanjul/const/colors.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            isDismissible: true,
            builder: (_)=> ReadInputSheet(
              selectedDate: selectedDate, // 선택된 날짜 넘겨주기
            ),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 20),
            TodayBanner(
              selectedDate: selectedDate, 
              count: 0),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<Book>>(
                stream: GetIt.I<LocalDatabase>().watchBooks(selectedDate),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Container();
                  }
                  return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    final book = snapshot.data![index];

                  return Dismissible(
                    key: ObjectKey(book.id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (DismissDirection direction) {
                      GetIt.I<LocalDatabase>()
                        .removeBook(book.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                      child: HowMuchRead(
                        startPage: book.startPage,
                        endPage: book.endPage,
                        totalPage: book.totalPage,
                        book: book.title,
                        author: book.author,
                        publish: book.publish,
                      ),
                    ),
                  );
                  },
                  );
                }
              )
            )
          ],
        )
      ),
    );
  }

void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}