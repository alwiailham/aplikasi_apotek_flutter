import 'package:flutter/material.dart';
import 'profile_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Apotek Sehat"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, Apoteker 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/images/apotek_logo.jpg',
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _menuItem(Icons.medical_services, "Data Obat"),
                  _menuItem(Icons.people, "Pelanggan"),
                  _menuItem(Icons.shopping_cart, "Transaksi"),
                  _menuItem(Icons.inventory, "Stok Obat"),
                  _menuItem(Icons.bar_chart, "Laporan"),
                  _menuItem(Icons.person, "Profil", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, [BuildContext? context]) {
    return GestureDetector(
      onTap: () {
        if (title == "Profil" && context != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfilePage()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green, size: 40),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
