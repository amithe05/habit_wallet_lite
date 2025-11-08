# habbit_wallet_lite

🪙 Habit Wallet Lite

## Getting Started

A clean and offline-first mini personal finance manager (PFM) built with Flutter, using BLoC, Hive, and Clean Architecture.

🚀 Features

✅ Offline-first with Hive

All transactions stored locally and loaded instantly.

Mock REST API setup ready for future sync integration.

✅ Transaction Management

Add, Edit, and Delete transactions.

Swipe to delete, pre-filled edit form.

Supports income and expense types.

✅ Charts & Insights

Monthly summary chart.

Category-wise pie chart (using fl_chart).

✅ Auth Stub (Email + PIN)

Dummy login with SecureStorage.

“Remember me” for auto-login.

Logout functionality.

✅ Theming & UX

Light/Dark mode toggle in AppBar.

Material 3 UI with smooth animations.

Responsive, accessible, and intuitive design.

✅ Error Handling

Global Snackbars for success and failure.

Retry option on data load errors.

🧱 Architecture Overview

Follows Clean Architecture with Domain / Data / Presentation layers.

lib/
 ┣ core/
 ┃ ┗ theme/
 ┣ features/
 ┃ ┣ auth/
 ┃ ┗ transactions/
 ┃    ┣ data/
 ┃    ┣ domain/
 ┃    ┗ presentation/
 ┗ main.dart


Data Layer: APIs, Hive, Models, Repository Implementations

Domain Layer: Entities, Use Cases, Repository Abstractions

Presentation Layer: BLoCs, Cubits, and Screens


🧪 How to Run : 

Clone this repo

git clone https://github.com/yourusername/habbit_wallet_lite.git


Get dependencies

flutter pub get

Run app

flutter run


🕓 Time Spent :

Day 1: Setup, architecture, Hive, Freezed, JSON parsing.

Day 2: UI, Charts, Auth stub, Edit/Delete, Theming, Error handling.

💡 If given one extra day:

Add daily 8PM notification (using flutter_local_notifications).

Add Tamil/Hindi localization (intl).

Add automated sync with conflict resolution.
