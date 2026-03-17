## 1.0.1

* **New Feature:** Added `isFull` parameter in `toFormattedDate` to support both `01/02/2026` and `01 Feb 2026` styles.
* **New Feature:** Added `timeLeft()` extension for countdowns or deadlines (e.g., "2d left", "৫ ঘণ্টা বাকি").
* **New Feature:** Precise `age` calculation returning a Map with years, months, and days.
* **New Feature:** Business logic helpers: `isWeekend` (BD Standard), `isSameDay()`, and `isBetween()`.
* **New Feature:** Navigation helpers: `startOfMonth`, `endOfMonth`, `nextDay`, and `previousDay`.
* **Improved:** Full Extension-based API for a more modern and cleaner developer experience.
* **Localization:** Focused support for English (EN) and Bengali (BN) across all functions.


## 1.0.0

* Initial release of **Date Snap**.
* Added support for `toFormattedDate` (English, Bengali, and Arabic digit support).
* Added support for `toTimeAgo` with multilingual message mapping.
* Zero-dependency architecture for lightweight performance.