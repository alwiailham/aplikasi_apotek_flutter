import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Apoteker"),
        backgroundColor: const Color.fromARGB(255, 175, 76, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/apoteker.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              "Drs. Alfiyatur Rohmaniah, S.Farm., Apt",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("ID Apoteker: 23670087"),
            Text("Email: apoteksehat@gmail.com"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [Text("Cabang"), Text("Apotek Sehat - Semarang")],
                ),
                SizedBox(width: 40),
                Column(children: [Text("Shift"), Text("Pagi (08:00 - 15:00)")]),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 176, 85, 141),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text("Kembali ke Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
