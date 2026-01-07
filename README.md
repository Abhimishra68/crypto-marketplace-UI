

```markdown
# 🚀 Crypto Wallet Dashboard (Flutter)

A modern cryptocurrency wallet dashboard built with Flutter, featuring real-time portfolio tracking, interactive charts, and seamless transaction management.

---

## ✨ Features

### 📊 Portfolio Overview
- Displays total wallet balance in USD
- Real-time profit/loss with percentage changes
- Supports multiple cryptocurrencies

### 📈 Advanced Analytics
- Interactive price trend charts
- Trading volume bar charts
- Multiple timeframes (1H, 4H, 1W, 1M, 3M, 1Y)
- Smooth chart animations using `fl_chart`

### 💸 Transaction Management
- Send and receive cryptocurrency
- Transaction history with timestamps
- Clean and readable transaction cards

### 🎨 User Experience
- Premium dark theme UI
- Fully responsive mobile layout
- Quick Send / Receive action buttons
- Bottom navigation for easy access

---

## 🧩 Project Structure

```

lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   ├── wallet_screen.dart
│   └── transaction_screen.dart
├── widgets/
│   ├── balance_card.dart
│   ├── chart_widget.dart
│   ├── transaction_item.dart
│   └── bottom_nav.dart
├── models/
│   ├── wallet_model.dart
│   ├── transaction_model.dart
│   └── chart_data.dart
└── services/
├── wallet_service.dart
└── api_service.dart

````

---

## 🖥️ UI Components

- Header with user greeting & profile
- Balance card with profit/loss indicator
- Interactive price & volume charts
- Recent transaction list
- Bottom navigation bar

---

## 🎨 Color Palette

| Purpose | Color |
|-------|-------|
| Primary | `#0A1929` |
| Accent | `#00D9FF` |
| Success | `#00E676` |
| Danger | `#FF3D3D` |
| Text | `#FFFFFF` |

---

## ⚙️ Getting Started

### Prerequisites
- Flutter 3.0+
- Dart 3.0+

### Installation

```bash
git clone https://github.com/yourusername/crypto-wallet-dashboard.git
cd crypto-wallet-dashboard
flutter pub get
flutter run
````

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  fl_chart: ^0.68.0
  provider: ^6.0.0
  http: ^1.1.0
  intl: ^0.19.0
```

---

## 🌐 API Integration

* CoinGecko API
* Binance API
* Custom wallet backend (optional)

---

## 🛣️ Future Enhancements

* 🔔 Price alert notifications
* 🔐 Biometric authentication
* 🌗 Dark / Light theme toggle
* 📤 Portfolio export (PDF/CSV)
* 📶 Offline mode support

---

## 🔒 Security Best Practices

* Secure key storage using Flutter Secure Storage
* HTTPS for all API requests
* Input validation for transactions
* API rate limiting & caching

---

## 🧪 Testing

```bash
flutter test
```

---

## 📸 Screenshots

<img width="300" src="https://github.com/user-attachments/assets/dd9969fb-c0c8-4b43-8013-5b1e47cbf0ab" />


<img width="300" src="https://github.com/user-attachments/assets/0da95bc4-198d-4d13-9b80-356dc063ffe6" />

---

## 📄 License

MIT License — free to use for personal and commercial projects.

---

## 💬 Support

For issues or suggestions, please open an issue on GitHub.


