import 'package:flutter/material.dart';


import 'SecondPage.dart';

void main() {
  runApp(anaSayfa());
}

class anaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes: {
        '/secondPage': (context) => secondPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/temizev2.webp'), // Arka plan resmi
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: Text('Hakkımızda', style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vizyonumuz ve Misyonumuz',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text(
                                  'Vizyonumuz: Her gün gelişen yeni teknolojileri takip ederek, bunları en iyi bir biçimde işimize yansıtarak, '
                                      'sürekli pozitif yönde değişen ve gelişen bir hizmet anlayışını prensip edinerek, sektörde farklılık yaratmak.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 40),
                                Text(
                                  'Misyonumuz: Her geçen gün daha iyi ve daha profesyonel bir hizmet anlayışıyla, üzerimize aldığımız işleri zamanında teslim ederek '
                                      'hem müşteri memnuniyetini artırmak hem de hizmet sektörüne en etkili bir biçimde katkıda bulunmak.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text(
                                  'Unutmayın Sizin İçin Buradayız...',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/secondPage');
                            },
                            child: Text('Anladım'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
