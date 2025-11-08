import 'package:flutter/material.dart';

void main() {
  runApp(ApotekApp());
}

class ApotekApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apotek Sehat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 143, 74, 102)),
      home: LoginPage(),
    );
  }
}

/* =========================
   HALAMAN LOGIN
   ========================= */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _doLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DashboardPage(
          username: usernameController.text.isEmpty
              ? 'Apoteker'
              : usernameController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selamat Datang di Apotek Sehat",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Solusi Kesehatan Anda yang terpercaya.",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 230, 111, 176),
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/images/apotek_logo.jpg',
                    height: 120,
                    errorBuilder: (_, __, ___) {
                      return Icon(
                        Icons.local_pharmacy,
                        size: 110,
                        color: const Color.fromARGB(255, 232, 120, 153),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 135, 168),
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                    ),
                    onPressed: _doLogin,
                    child: Text("Masuk"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* =========================
   HALAMAN DASHBOARD
   ========================= */
class DashboardPage extends StatelessWidget {
  final String username;
  DashboardPage({this.username = 'Apoteker'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Apotek Sehat"),
        backgroundColor: const Color.fromARGB(255, 223, 109, 154),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tidak ada notifikasi baru')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, $username 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/banner_apotek.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  color: const Color.fromARGB(255, 193, 109, 148),
                  child: Center(
                    child: Icon(
                      Icons.local_pharmacy,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _menuItem(context, Icons.medical_services, "Obat", null),
                  _menuItem(context, Icons.people, "Pelanggan", null),
                  _menuItem(context, Icons.shopping_cart, "Transaksi", null),
                  _menuItem(context, Icons.inventory, "Stok", null),
                  _menuItem(context, Icons.bar_chart, "Laporan", null),
                  _menuItem(context, Icons.person, "Profil", ProfilePage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title belum diimplementasikan')),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 220, 147, 163),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================
   HALAMAN PROFIL
   ========================= */
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Apoteker"),
        backgroundColor: const Color.fromARGB(255, 231, 118, 163),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 54,
              backgroundImage: AssetImage('assets/images/apoteker.jpg'),
            ),
            SizedBox(height: 18),
            Text(
              "Drs. Alfiyatur Rohmaniah, S.Farm., Apt",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text("ID Apoteker: 23670087"),
            SizedBox(height: 4),
            Text("Email: apoteksehat@gmail.com"),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Cabang",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("Apotek Sehat - Semarang"),
                  ],
                ),
                SizedBox(width: 36),
                Column(
                  children: [
                    Text(
                      "Shift",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("Pagi (08:00 - 15:00)"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 26),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              label: Text("Kembali ke Dashboard"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 135, 168),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
