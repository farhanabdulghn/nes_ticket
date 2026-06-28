# NES Ticket

Aplikasi mobile untuk sistem manajemen tiket yang dibangun dengan arsitektur modern dan performa tinggi menggunakan Flutter.

## 🛠 Spesifikasi Teknis
- **Flutter SDK:** 3.44.2

## 🚀 Fitur Utama

- **State Management:** Menggunakan `Riverpod` untuk manajemen state yang reaktif dan mudah di-maintain.
- **Offline Capabilities:** Integrasi `Hive` (Community Edition) untuk penyimpanan data lokal yang cepat.
- **Networking:** Komunikasi API yang terstruktur menggunakan `Dio`.
- **Immutable Models:** Data model yang aman dengan `Freezed` dan `json_serializable`.
- **Secure Storage:** Penyimpanan kredensial sensitif menggunakan `flutter_secure_storage`.
- **Crash Reporting:** Monitoring stabilitas aplikasi dengan `Firebase Crashlytics`.
- **Asset Management:** Akses aset (gambar/ikon) yang aman dan otomatis dengan `flutter_gen`.

## 📦 Tech Stack & Packages

### Utama
- **State Management:** `flutter_riverpod`, `riverpod_annotation`
- **Networking:** `dio`
- **Database:** `hive_ce`, `hive_ce_flutter`
- **Security:** `flutter_secure_storage`
- **Firebase:** `firebase_core`, `firebase_crashlytics`

### UI & Assets
- **Icons:** `phosphoricons_flutter`
- **Fonts:** `google_fonts`
- **Images:** `cached_network_image`, `flutter_svg`

### Development Tools
- `build_runner` & `riverpod_generator`
- `freezed`
- `flutter_gen_runner`

## 🛠 Pengembangan

Proyek ini menggunakan *code generation*. Jika Anda melakukan perubahan pada *model*, *provider*, atau menambahkan aset, jalankan perintah berikut di terminal:

```bash
dart run build_runner build --delete-conflicting-outputs