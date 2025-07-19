# 🐱 Cat Gallery App

แอปพลิเคชันดูภาพแมวที่สร้างด้วย Flutter โดยใช้ The Cat API

## ✨ ฟีเจอร์

- **ภาพแมวสุ่ม**: ดูภาพแมวสุ่มจาก The Cat API
- **รายการสายพันธุ์**: ดูรายการสายพันธุ์แมวต่างๆ พร้อมข้อมูล
- **รายละเอียดสายพันธุ์**: ดูข้อมูลละเอียดของแต่ละสายพันธุ์
- **ภาพขนาดใหญ่**: ดูภาพแมวในขนาดใหญ่
- **ลิงก์ Wikipedia**: เปิดลิงก์ไปยัง Wikipedia สำหรับข้อมูลเพิ่มเติม
- **โหมดออฟไลน์**: ใช้ข้อมูลจำลองเมื่อไม่มีอินเทอร์เน็ต

## 🛠️ เทคโนโลยีที่ใช้

- **Flutter**: Framework สำหรับพัฒนาแอปพลิเคชัน
- **The Cat API**: API สำหรับข้อมูลแมว (ฟรี 100% ไม่ต้อง API key)
- **HTTP**: สำหรับเรียก API
- **Cached Network Image**: สำหรับแคชภาพ
- **Shimmer**: สำหรับ loading effect
- **URL Launcher**: สำหรับเปิดลิงก์ภายนอก

## 📱 การติดตั้ง

1. Clone โปรเจค
```bash
git clone <repository-url>
cd catapp
```

2. ติดตั้ง dependencies
```bash
flutter pub get
```

3. รันแอปพลิเคชัน
```bash
flutter run
```

## 🏗️ โครงสร้างโปรเจค

```
lib/
├── main.dart                 # Entry point
├── models/
│   └── cat.dart             # Model classes
├── services/
│   └── cat_api_service.dart # API service
├── screens/
│   ├── home_screen.dart     # หน้าหลัก
│   ├── breeds_screen.dart   # หน้าสายพันธุ์
│   └── cat_detail_screen.dart # หน้ารายละเอียด
└── widgets/
    └── cat_card.dart        # Widget แสดงการ์ดแมว
```

## 🔧 การจำลอง API

แอปพลิเคชันนี้มีการจำลอง API สำหรับการศึกษา:

- **Mock Data**: มีข้อมูลจำลองสำหรับแมวและสายพันธุ์
- **Fallback**: ใช้ข้อมูลจำลองเมื่อ API ไม่สามารถเข้าถึงได้
- **Offline Support**: สามารถใช้งานได้แม้ไม่มีอินเทอร์เน็ต

## 📊 API Endpoints ที่ใช้

- `GET /images/search` - ดูภาพแมวสุ่ม
- `GET /breeds` - ดูรายการสายพันธุ์
- `GET /images/search?breed_ids={id}` - ดูภาพตามสายพันธุ์

## 🎨 UI/UX Features

- **Material Design 3**: ใช้ Material Design 3
- **Responsive Grid**: แสดงภาพในรูปแบบ grid
- **Loading States**: แสดง loading indicator
- **Error Handling**: จัดการข้อผิดพลาดอย่างเหมาะสม
- **Pull to Refresh**: ลากลงเพื่อรีเฟรชข้อมูล

## 📸 Screenshots

(เพิ่ม screenshots ของแอปพลิเคชันที่นี่)

## 🤝 การมีส่วนร่วม

1. Fork โปรเจค
2. สร้าง feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit การเปลี่ยนแปลง (`git commit -m 'Add some AmazingFeature'`)
4. Push ไปยัง branch (`git push origin feature/AmazingFeature`)
5. เปิด Pull Request

## 📄 License

โปรเจคนี้อยู่ภายใต้ MIT License - ดูไฟล์ [LICENSE](LICENSE) สำหรับรายละเอียด

## 🙏 ขอบคุณ

- [The Cat API](https://thecatapi.com/) สำหรับ API ที่ยอดเยี่ยม
- [Flutter](https://flutter.dev/) สำหรับ framework ที่ดี
- [Unsplash](https://unsplash.com/) สำหรับภาพตัวอย่าง

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# CatApp
