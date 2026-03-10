import 'package:date_snap/date_snap.dart';

void main() {
  DateTime now = DateTime.now();
  DateTime pastTime = DateTime.now().subtract(const Duration(minutes: 5));

  // ১. Date Formatting (তারিখ ফরম্যাট)
  print(now.toFormattedDate(lang: 'en')); // Output: 10/3/2026
  print(now.toFormattedDate(lang: 'bn')); // Output: ১০/৩/২০২৬
  print(now.toFormattedDate(lang: 'ar')); // Output: ١٠/٣/٢٠٢٦

  // ২. Relative Time (সময় কতক্ষণ আগে)
  print(pastTime.toTimeAgo(lang: 'en')); // Output: 5m ago
  print(pastTime.toTimeAgo(lang: 'bn')); // Output: ৫ মিনিট আগে
  print(pastTime.toTimeAgo(lang: 'ar')); // Output: ٥ دقيقة مضت
}