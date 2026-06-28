# NES Ticket

A modern mobile ticket management application built with Flutter, focusing on high performance, maintainability, and a scalable architecture.

## 🛠 Technical Specifications

- **Flutter SDK:** 3.44.4

## 🚀 Features

- **Reactive State Management** using `Riverpod`.
- **Offline Support** powered by `Hive Community Edition` for fast local data storage.
- **Robust Networking** with `Dio` for clean and efficient API communication.
- **Immutable Data Models** using `Freezed` and `json_serializable`.
- **Secure Storage** for sensitive data with `flutter_secure_storage`.
- **Type-safe Asset Management** using `flutter_gen`.

## 📦 Tech Stack

### Core

- **State Management:** `flutter_riverpod`, `riverpod_annotation`
- **Networking:** `dio`
- **Local Database:** `hive_ce`, `hive_ce_flutter`
- **Secure Storage:** `flutter_secure_storage`

### UI & Assets

- **Icons:** `phosphoricons_flutter`
- **Fonts:** `google_fonts`
- **Images:** `cached_network_image`, `flutter_svg`

### Development

- `build_runner`
- `riverpod_generator`
- `freezed`
- `flutter_gen_runner`

## 📱 Screenshots

<p align="center">
  <img src="assets/screenshots/1.png" width="220" alt="Screenshot 1"/>
  <img src="assets/screenshots/2.png" width="220" alt="Screenshot 2"/>
  <img src="assets/screenshots/3.png" width="220" alt="Screenshot 3"/>
</p>

<p align="center">
  <img src="assets/screenshots/4.png" width="220" alt="Screenshot 4"/>
  <img src="assets/screenshots/5.png" width="220" alt="Screenshot 5"/>
  <img src="assets/screenshots/6.png" width="220" alt="Screenshot 6"/>
</p>

<p align="center">
  <img src="assets/screenshots/7.png" width="220" alt="Screenshot 7"/>
</p>

## 🛠 Development

This project uses **code generation**. Whenever you modify models, providers, or assets, run the following command:

```bash
dart run build_runner build --delete-conflicting-outputs
```