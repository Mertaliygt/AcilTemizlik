import 'package:acil_temizlik/SecondPage.dart'; // Kampanya sayfasını tanımladığınız yer
import 'package:flutter/material.dart';

void main() => runApp(HesapMakinesi());

class HesapMakinesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basit Hesap Makinesi'),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num sayi1 = 0, sayi2 = 0, sonuc = 0;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  // Toplama işlemi
  void sayiTopla() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  // Çıkarma işlemi
  void sayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  // Çarpma işlemi
  void sayiCarp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  // Bölme işlemi
  void sayiBol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(80),
        child: Column(
          children: <Widget>[
            Text(
              "$sonuc",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: t1,
              decoration: InputDecoration(
                labelText: "Birinci Sayı",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: t2,
              decoration: InputDecoration(
                labelText: "İkinci Sayı",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: sayiTopla,
                  child: Text("Topla"),
                ),
                ElevatedButton(
                  onPressed: sayiCikar,
                  child: Text("Çıkar"),
                ),
                ElevatedButton(
                  onPressed: sayiCarp,
                  child: Text("Çarp"),
                ),
                ElevatedButton(
                  onPressed: sayiBol,
                  child: Text("Böl"),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => kampanyaPage()), // Kampanya sayfasına git
                );
              },
              child: Text("Kampanya Sayfasına Git"),
            )
          ],
        ),
      ),
    );
  }
}
