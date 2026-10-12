import 'package:flutter/material.dart';

// Bước 1: khai báo biến điểm có giá trị 8.5
const double diem = 8.5;

// Danh sách điểm cho phần "Kiểm tra thêm" (bước 4)
const List<double> diemKiemTra = [9, 7, 5.5, 3, 11];

const Color navy = Color(0xFF2B4478);

// Bước 2: hàm nhận điểm và trả về xếp loại (dùng if / else)
String xepLoai(double d) {
  if (d < 0 || d > 10) {
    return 'Không hợp lệ';
  } else if (d >= 8.0) {
    return 'Giỏi';
  } else if (d >= 6.5) {
    return 'Khá';
  } else if (d >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}

// Bước 3: chọn màu chữ theo xếp loại, cũng dùng if
Color mauChu(String loai) {
  if (loai == 'Giỏi') {
    return const Color(0xFF2E7D32);
  } else if (loai == 'Khá') {
    return const Color(0xFF1E5AA8);
  } else if (loai == 'Trung bình') {
    return const Color(0xFFB26A00);
  } else if (loai == 'Yếu') {
    return const Color(0xFFC62828);
  } else {
    return const Color(0xFF616161);
  }
}

// Màu nền nhạt tương ứng cho nhãn xếp loại
Color mauNen(String loai) {
  if (loai == 'Giỏi') {
    return const Color(0xFFE3F4E3);
  } else if (loai == 'Khá') {
    return const Color(0xFFE1ECFA);
  } else if (loai == 'Trung bình') {
    return const Color(0xFFFFF0D6);
  } else if (loai == 'Yếu') {
    return const Color(0xFFFBE3E3);
  } else {
    return const Color(0xFFECEEF2);
  }
}

// 9.0 -> "9", 5.5 -> "5.5"
String dinhDang(double d) {
  if (d == d.truncateToDouble()) {
    return d.toInt().toString();
  }
  return d.toString();
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XepLoaiScreen(),
    );
  }
}

class XepLoaiScreen extends StatelessWidget {
  const XepLoaiScreen({super.key});

  // Một dòng trong phần "Kiểm tra thêm"
  Widget _buildRow(double d, bool isLast) {
    final String loai = xepLoai(d);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLast ? Colors.transparent : const Color(0xFFE8EAEF),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Điểm ${dinhDang(d)}', style: const TextStyle(fontSize: 14)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: mauNen(loai),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              loai,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: mauChu(loai),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String loaiChinh = xepLoai(diem);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: const Text(
          'Xếp loại học lực',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF2F4F8),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thẻ điểm trung bình
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'Điểm trung bình',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dinhDang(diem),
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: mauNen(loaiChinh),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      loaiChinh,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mauChu(loaiChinh),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'KIỂM TRA THÊM',
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),

            // Bước 4: gọi hàm với các điểm 9, 7, 5.5, 3, 11
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < diemKiemTra.length; i++)
                    _buildRow(diemKiemTra[i], i == diemKiemTra.length - 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}