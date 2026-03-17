import 'package:flutter/foundation.dart';

extension DateSnap on DateTime {
  
  /// 1. Helper to convert digits and month names to localized format (EN, BN)
  String _convert(String input, String lang, {bool isMonth = false}) {
    final Map<String, Map<String, String>> digits = {
      'en': {'0': '0', '1': '1', '2': '2', '3': '3', '4': '4', '5': '5', '6': '6', '7': '7', '8': '8', '9': '9'},
      'bn': {'0': '০', '1': '১', '2': '২', '3': '৩', '4': '৪', '5': '৫', '6': '৬', '7': '৭', '8': '৮', '9': '৯'},
    };

    final Map<String, Map<int, String>> monthNames = {
      'en': {1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'},
      'bn': {1: 'জানুয়ারি', 2: 'ফেব্রুয়ারি', 3: 'মার্চ', 4: 'এপ্রিল', 5: 'মে', 6: 'জুন', 7: 'জুলাই', 8: 'আগস্ট', 9: 'সেপ্টেম্বর', 10: 'অক্টোবর', 11: 'নভেম্বর', 12: 'ডিসেম্বর'},
    };

    if (isMonth) {
      int? m = int.tryParse(input);
      return monthNames[lang]?[m] ?? input;
    }

    return input.split('').map((char) => digits[lang]?[char] ?? char).join();
  }

  /// 2. Date formatting helper
  /// [isFull] = true: 01 Feb 2026 | [isFull] = false: 01/02/2026
  String toFormattedDate({String lang = 'en', bool isFull = false}) {
    String d = _convert(day.toString().padLeft(2, '0'), lang);
    String y = _convert(year.toString(), lang);

    if (isFull) {
      String mName = _convert(month.toString(), lang, isMonth: true);
      return "$d $mName $y";
    } else {
      String m = _convert(month.toString().padLeft(2, '0'), lang);
      return "$d/$m/$y";
    }
  }

  /// 3. Relative time (e.g., 5m ago, ৫ মিনিট আগে)
  String toTimeAgo({String lang = 'en'}) {
    final difference = DateTime.now().difference(this);
    final Map<String, Map<String, String>> messages = {
      'en': {'now': 'Just now', 'm': 'm ago', 'h': 'h ago', 'd': 'd ago'},
      'bn': {'now': 'এইমাত্র', 'm': ' মিনিট আগে', 'h': ' ঘণ্টা আগে', 'd': ' দিন আগে'},
    };
    final msg = messages[lang] ?? messages['en']!;
    if (difference.inSeconds < 60) return msg['now']!;
    
    String num, unit;
    if (difference.inMinutes < 60) {
      num = _convert(difference.inMinutes.toString(), lang);
      unit = msg['m']!;
    } else if (difference.inHours < 24) {
      num = _convert(difference.inHours.toString(), lang);
      unit = msg['h']!;
    } else {
      num = _convert(difference.inDays.toString(), lang);
      unit = msg['d']!;
    }
    return "$num$unit";
  }

  /// 4. Time left (e.g., 2d left, ৩ দিন বাকি)
  String timeLeft({String lang = 'en'}) {
    final difference = this.difference(DateTime.now());
    final Map<String, Map<String, String>> messages = {
      'en': {'ended': 'Ended', 'd': 'd left', 'h': 'h left', 'm': 'm left'},
      'bn': {'ended': 'সময় শেষ', 'd': ' দিন বাকি', 'h': ' ঘণ্টা বাকি', 'm': ' মিনিট বাকি'},
    };
    final msg = messages[lang] ?? messages['en']!;
    if (difference.isNegative) return msg['ended']!;
    
    String num, unit;
    if (difference.inDays > 0) {
      num = _convert(difference.inDays.toString(), lang);
      unit = msg['d']!;
    } else if (difference.inHours > 0) {
      num = _convert(difference.inHours.toString(), lang);
      unit = msg['h']!;
    } else {
      num = _convert(difference.inMinutes.toString(), lang);
      unit = msg['m']!;
    }
    return "$num$unit";
  }

  /// 5. Precise Age Calculation
  Map<String, int> get age {
    DateTime now = DateTime.now();
    int years = now.year - year, months = now.month - month, days = now.day - day;
    if (months < 0 || (months == 0 && days < 0)) { years--; months += (days < 0 ? 11 : 12); }
    if (days < 0) { days += DateTime(now.year, now.month, 0).day; months--; }
    return {'years': years, 'months': months, 'days': days};
  }

  /// 6. Comparison & Helpers
  bool isSameDay(DateTime other) => year == other.year && month == other.month && day == other.day;
  bool isBetween(DateTime start, DateTime end) => isAfter(start) && isBefore(end);
  bool get isWeekend => weekday == DateTime.friday || weekday == DateTime.saturday;

  /// 7. Month & Day Navigation
  DateTime get startOfMonth => DateTime(year, month, 1);
  DateTime get endOfMonth => DateTime(year, month + 1, 0);
  DateTime get nextDay => add(const Duration(days: 1));
  DateTime get previousDay => subtract(const Duration(days: 1));
}