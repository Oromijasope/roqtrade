# Roqqu Mobile Developer Assessment (Roqtrade)

This project is my submission for the **Mobile Developer Assessment at Roqqu**.
The task involved designing and implementing the provided Figma UI and integrating it with **real-time APIs** using **Flutter**.

## 🧩 Overview

The app displays real-time cryptocurrency data fetched via **WebSocket and REST APIs** and visualizes it in an **interactive, responsive, and elegant interface**.
It focuses on **performance**, **clean architecture**, and a **fluid user experience**, closely following the provided Figma design.


## 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** Stacked
* **API Integration:** CoinGecko REST & WebSocket APIs
* **Architecture:** MVVM
* **Version Control:** Git & GitHub


## 🔌 API Service

The app fetches cryptocurrency data via `ApiService`. Key functionalities:

```dart
class ApiService {
  // Fetch the current price, 24h change %, and coin icon
  Future<Map<String, dynamic>> fetchCoinData(String symbol) {...}

  // Fetch top 20 coins by market cap
  Future<List<Map<String, dynamic>>> fetchTop20Coins() {...}

  // Fetch market chart data for a coin over a number of days
  Future<List<FlSpot>> fetchCoinMarketChart(String coinId, int days) {...}
}
```

**Highlights:**

* Uses **http package** for REST calls
* Returns structured data ready for UI binding
* Includes **error handling** for failed requests
* Compatible with **real-time updates and chart plotting** (`fl_chart`)

This demonstrates **clean, modular API integration** and separation of concerns between UI and data logic.

---

## ⚙️ Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Oromijasope/roqtrade.git
   cd roqqu-mobile-assessment
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

> Tested on **Flutter 3.24.5** and **Dart 3.5.4**.


## 🧾 Notes

* Built exclusively for the **Roqqu Mobile Developer assessment**
* No external assets or confidential materials were shared
* WebSocket and REST API data is fetched from **public APIs**


## 🏁 License

This project is for **technical assessment purposes only** and remains the property of **Roqqu**.


