import 'package:acil_temizlik/login_page.dart';
import 'package:acil_temizlik/sign_up.dart';
import 'package:flutter/material.dart';

class firmaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/kayit.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // İçerik
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Merhaba Sayın Yetkili',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  Text(
                    'Sizin İş Yapmak Konusunda Heyecanlıyız',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  Text(
                    'Kayıt bilgilerinizi girdikten sonra tarafımızca '
                        'incelenip size geri dönüş yapılacaktır...',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // TextField'lar
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Firma Adı',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Firma Yetkilisi',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(

                    decoration: InputDecoration(
                      labelText: 'Vergi Kimlik No',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Faaliyet Bilgisi',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24.0),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {

                        showDialog(
                          context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Bilgileriniz Gönderildi !'),
                              content: Text('İnceleme Ortalama 3-4 Gün Sürmektedir.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ));
                                  },
                                  child: Text('Geri Dön'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Yolla'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
