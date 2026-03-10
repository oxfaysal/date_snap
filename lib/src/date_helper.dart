extension DateSnap on DateTime {
  
  /// Helper to convert digits to localized format (English, Bengali, Arabic)
  String _convert(String input, String lang) {
    final Map<String, Map<String, String>> digits = {
      'en': {'0': '0', '1': '1', '2': '2', '3': '3', '4': '4', '5': '5', '6': '6', '7': '7', '8': '8', '9': '9'},
      'bn': {'0': '০', '1': '১', '2': '২', '3': '৩', '4': '৪', '5': '৫', '6': '৬', '7': '৭', '8': '৮', '9': '৯'},
      'ar': {'0': '٠', '1': '١', '2': '٢', '3': '٣', '4': '٤', '5': '٥', '6': '٦', '7': '٧', '8': '٨', '9': '٩'}
    };
    return input.split('').map((char) => digits[lang]?[char] ?? char).join();
  }

  /// Date formatting helper with Language Support
  String toFormattedDate({String lang = 'en'}) {
    String d = _convert(day.toString(), lang);
    String m = _convert(month.toString(), lang);
    String y = _convert(year.toString(), lang);
    return "$d/$m/$y";
  }

  /// Relative time calculation with Language Support
  String toTimeAgo({String lang = 'en'}) {
    final difference = DateTime.now().difference(this);

    final Map<String, Map<String, String>> messages = {
      'en': {'now': 'Just now', 'm': 'm ago', 'h': 'h ago', 'd': 'd ago'},
      'bn': {'now': 'এইমাত্র', 'm': ' মিনিট আগে', 'h': ' ঘণ্টা আগে', 'd': ' দিন আগে'},
      'ar': {'now': 'الآن', 'm': ' دقيقة مضت', 'h': ' ساعة مضت', 'd': ' يوم مضى'}
    };

    final msg = messages[lang] ?? messages['en']!;

    if (difference.inSeconds < 60) return msg['now']!;
    
    // Using _convert for numbers to ensure localized digits (e.g., 2 hours ago)
    if (difference.inMinutes < 60) {
      return "${_convert(difference.inMinutes.toString(), lang)}${msg['m']}";
    }
    if (difference.inHours < 24) {
      return "${_convert(difference.inHours.toString(), lang)}${msg['h']}";
    }
    return "${_convert(difference.inDays.toString(), lang)}${msg['d']}";
  }
}