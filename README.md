# Date Snap

**Date Snap** is a lightweight, zero-dependency Flutter package designed to make date formatting and relative time calculations incredibly simple. It supports localization out of the box, allowing you to display dates and times in **English, Bengali, and Arabic** seamlessly.

---

## 🚀 Features
- **Zero Dependency:** Lightweight and easy to integrate without bloat.
- **Localized Formatting:** Native support for English, Bengali, and Arabic digit representations.
- **Time Ago Calculation:** Provides readable relative time strings like "2 hours ago" or "২ ঘণ্টা আগে".
- **Easy to Use:** Intuitive extension methods on the `DateTime` class.

---

## 📦 Installation

Add `date_snap` to your `pubspec.yaml` file:

```yaml
dependencies:
  date_snap: ^1.0.0

```

## 📖 Usage

Import the package into your `Dart` file:

```Dart
import 'package:date_snap/date_snap.dart';
```


### 1. Date Formatting

Format dates into strings with `local digit` support:

```Dart
DateTime now = DateTime.now();

print(now.toFormattedDate(lang: 'en')); // Output: 10/3/2026
print(now.toFormattedDate(lang: 'bn')); // Output: ১০/৩/২০২৬
print(now.toFormattedDate(lang: 'ar')); // Output: ١٠/٣/٢٠٢٦
```

### 2. Time Ago

Calculate relative time effortlessly:

```Dart
DateTime pastDate = DateTime.now().subtract(const Duration(hours: 2));

print(pastDate.toTimeAgo(lang: 'en')); // Output: 2h ago
print(pastDate.toTimeAgo(lang: 'bn')); // Output: ২ ঘণ্টা আগে
print(pastDate.toTimeAgo(lang: 'ar')); // Output: ٢ ساعة مضت
```


