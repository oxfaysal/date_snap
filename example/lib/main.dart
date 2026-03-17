import 'package:date_snap/date_snap.dart';

void main() {
  // 1. Current DateTime
  DateTime now = DateTime.now();
  DateTime pastTime = now.subtract(const Duration(minutes: 15));
  DateTime futureTime = now.add(const Duration(days: 2, hours: 5));
  DateTime birthday = DateTime(2002, 10, 20);

  print('--- 📅 DATE_SNAP PACKAGE EXAMPLE --- \n');

  // 2. Date Formatting (Short & Full)
  print('1. DATE FORMATTING:');
  print('   English (Short): ${now.toFormattedDate(lang: 'en')}'); // 17/03/2026
  print('   Bengali (Full):  ${now.toFormattedDate(lang: 'bn', isFull: true)}'); // ১৭ মার্চ ২০২৬
  print('   Bengali (Short): ${now.toFormattedDate(lang: 'bn')} \n'); // ১৭/০৩/২০২৬

  // 3. Relative Time (Time Ago)
  print('2. RELATIVE TIME (AGO):');
  print('   English: ${pastTime.toTimeAgo(lang: 'en')}'); // 15m ago
  print('   Bengali: ${pastTime.toTimeAgo(lang: 'bn')} \n'); // ১৫ মিনিট আগে

  // 4. Time Left / Countdown
  print('3. TIME LEFT:');
  print('   Future Event: ${futureTime.timeLeft(lang: 'en')}'); // 2d left
  print('   Bengali:      ${futureTime.timeLeft(lang: 'bn')} \n');

  // 5. Age Calculation
  var myAge = birthday.age;
  print('4. AGE CALCULATION:');
  print('   Born: ${birthday.toFormattedDate(isFull: true)}');
  print('   Age:  ${myAge['years']} Years, ${myAge['months']} Months, ${myAge['days']} Days \n');

  // 6. Business & Navigation (Helpers)
  print('5. HELPERS:');
  print('   Is Today Weekend? : ${now.isWeekend ? "Yes (Holiday)" : "No (Workday)"}');
  print('   First Day of Month: ${now.startOfMonth.toFormattedDate()}');
  print('   Last Day of Month : ${now.endOfMonth.toFormattedDate()}');
  print('   Next Day Check    : ${now.nextDay.toFormattedDate()}');
  
  print('\n-------------------------------------');
}