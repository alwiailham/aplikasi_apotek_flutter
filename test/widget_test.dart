import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('ApotekApp loads successfully', (WidgetTester tester) async {
    // Jalankan aplikasi Apotek
    await tester.pumpWidget(ApotekApp());

    // Pastikan halaman login muncul
    expect(find.text('Selamat Datang di Apotek Sehat'), findsOneWidget);
  });
}
