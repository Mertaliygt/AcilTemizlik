import 'package:acil_temizlik/anasayfa.dart';
import 'package:acil_temizlik/hesapPage.dart';
import 'package:acil_temizlik/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/pandabar.dart';

void main() {
  runApp(secondPage());
}

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String page = 'Blue';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        backgroundColor: Colors.black,
        buttonColor: Colors.white,
        buttonData: [
          PandaBarButtonData(
            id: 'Blue',
            icon: Icons.add_business,
            title: 'EV',
          ),
          PandaBarButtonData(
            id: 'Green',
            icon: Icons.add_business_outlined,
            title: 'İŞ',
          ),
          PandaBarButtonData(
            id: 'Red',
            icon: Icons.car_crash_outlined,
            title: 'Oto Yıkama',
          ),
          PandaBarButtonData(
            id: 'Yellow',
            icon: Icons.account_circle,
            title: 'Size Özel',

          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: Text('Umarım Memnun Kalmışsınızdır :)'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Üye Ol'),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp() ));
                    },
                  )
                ],
              );
            },
          );
        },
      ),
      body: Builder(
        builder: (context) {
          switch (page) {
            case 'Green':
              return greenPage();
            case 'Blue':
              return BluePage();
            case 'Red':
              return redPage();
            case 'Yellow':
              return kampanyaPage();
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NextPage()),
          );
        },
        child: Text('İleri', style: TextStyle(fontSize: 12)),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      


    );

  }
} ////!!!!!!!!!!!!!!!!!!!!!!!!!
    //////////////////////////////
class duyurularPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyuru Sayfasındasınız'),
        backgroundColor: Colors.black12,
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text(
                'Menü',
                style: TextStyle(color: Colors.black12, fontSize: 25),
              ),
              decoration: BoxDecoration( image: DecorationImage(
                image: AssetImage('assets/images/mert.webp'),
                fit: BoxFit.cover,

              ),

                // color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.campaign),
              title: Text('Duyurular'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => duyurularPage() )); //buna kullanacağım unutma!!!
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Ürünler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => redPage() ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Özel Teklifler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => kampanyaPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('İletişim'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => iletisimSayfa() ));   //// !!!!!!!!!!!!!!!!
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Hizmetlere Dönüş'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => secondPage()));
              },
            ),ListTile(
              leading: Icon(Icons.settings),
              title: Text('Hesaplayıcı'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HesapMakinesi() ));
              },
            ),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duyurular',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildCampaignCard('Sürüm Güncellemesi Versiyon (1.2.1V)!'),
                  buildCampaignCard('Bakım Güncellemesi (12.05)!'),
                  buildCampaignCard('Talep Alımları...!'),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCampaignCard(String campaignText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          campaignText,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

///////////////////////////////
class kampanyaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kampanyalar'),
        backgroundColor: Colors.black12,
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text(
                'Menü',
                style: TextStyle(color: Colors.black12, fontSize: 25),
              ),
              decoration: BoxDecoration( image: DecorationImage(
                image: AssetImage('assets/images/mert.webp'),
                fit: BoxFit.cover,

              ),

               // color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.campaign),
              title: Text('Duyurular'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => duyurularPage() )); //buna kullanacağım unutma!!!
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('Ürünler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => redPage() ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Özel Teklifler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => kampanyaPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('İletişim'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => iletisimSayfa() ));   //// !!!!!!!!!!!!!!!!
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Başa Dön '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage() ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Hesaplayıcı'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HesapMakinesi() ));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kampanyalar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildCampaignCard('Kampanya : Yiğitler Halı Yıkamada %15 İndirim'),
                  buildCampaignCard('Kampanya : Yapılan 2. Harcama da %5 Geri İade'),
                  buildCampaignCard('Kampanya : Uygulamaya Yorum Yap Hediye Kod Kazan'),
                  buildCampaignCard('Kampanya : İş Yeri Temizliğinde Personel Ücreti Bizden!  '),
                  buildCampaignCard('Kampanya : Referans İle Kaydolanlara %5 İndirim'),
                  buildCampaignCard('Kampanya : Uygulamadan Kayıt Oluşturmaya İndirim'),
                  buildCampaignCard('Kampanya : Yakında...'),
                  buildCampaignCard('Kampanya : Yakında...'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCampaignCard(String campaignText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          campaignText,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class BluePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(



      appBar: AppBar(
        title: Text(' Halı Yıkama  Hizmetindesiniz :)', style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            buildImageCard(context, 'assets/images/ygt.png', 'Yiğitler Temizlik A.Ş (Tuzla)', () {
              showInfoDialog(context, 'Fiyatlar 80 TL"den Başlıyor');


              print('Firma 1 tıklandı');
            }),
            buildImageCard(context, 'assets/images/akar.png', 'Akar Tem.Ltd (Pendik) ', () {
              showInfoDialog(context, 'Fiyatlar 70 TL"den Başlıyor');

              print('Firma 2 tıklandı');
            }),
            buildImageCard(context, 'assets/images/swan.jpg', 'Swan Halı Yıkama (Ataşehir)', () {
              showInfoDialog(context, 'Fiyatlar 85 TL"den Başlıyor');

              print('Firma 3 tıklandı');
            }),
            buildImageCard(context, 'assets/images/güven.jpg', 'Güven Kuru Temizleme (Pendik)', () {
              showInfoDialog(context, 'Fiyatlar 60 TL"den Başlıyor');

              print('Firma 4 tıklandı');
            }),
          ],
        ),
      ),
    );
  }
  void showInfoDialog(BuildContext context, String firmName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(firmName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Detaylar İçin Lütfen İletişime Geçiniz'),
              Text(""),
              Text('Hizmet Tarihi: Firma Oluşturuyor'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sipariş verildi')),
                );
              },
              child: Text('MİSAFİR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('MODUNDASINIZ'),
            ),
          ],
        );
      },
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}  ////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
class greenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' İş Yeri Temizlik Firmalarımız :)', style:TextStyle(color: Colors.black, fontStyle: FontStyle.italic),),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: GridView.count(
          crossAxisCount: 2, // Yan yana 2 sütun
          children: [
            buildImageCard(context, 'assets/images/ygt.png', 'Yiğitler Temizlik A.Ş (Tuzla)', () {
              showInfoDialog(context, 'MT2 Fiyatı 50 TL ');

              // Firma 1 tıklama işlemi
              print('Firma 1 tıklandı');
            }),
            buildImageCard(context, 'assets/images/vip.jpg', 'Vip Temizlik (Hadımköy) ', () {
              showInfoDialog(context, 'MT2 Fiyatı 47 TL');
              // Firma 2 tıklama işlemi
              print('Firma 2 tıklandı');
            }),
            buildImageCard(context, 'assets/images/isilti.jpg', 'Işıltı End.Tem (Beylikdüzü)', () {
              showInfoDialog(context, 'MT2 Fiyatı 35 TL');
              // Firma 3 tıklama işlemi
              print('Firma 3 tıklandı');
            }),
            buildImageCard(context, 'assets/images/ortak.jpg', 'Bizimle Çalışmak İster misiniz?', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');
              // Firma 4 tıklama işlemi
              print('Firma 4 tıklandı');
            }),
            buildImageCard(context, 'assets/images/ortak.jpg', 'Yeriniz Hazır!', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');
              // Firma 4 tıklama işlemi
              print('Firma 5 tıklandı');
            }),
            buildImageCard(context, 'assets/images/ortak.jpg', 'Sizi Burada Görmek İsteriz', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');
              // Firma 4 tıklama işlemi
              print('Firma 6 tıklandı');
            }),
          ],
        ),
      ),
    );
  }
  void showInfoDialog(BuildContext context, String firmName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(firmName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Detaylar İçin Lütfen İletişime Geçiniz'),
              Text(""),
              Text('Hizmet Tarihi: Firma Oluşturuyor'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sipariş verildi')),
                );
              },
              child: Text('MİSAFİR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('MODUNDASINIZ'),
            ),
          ],
        );
      },
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
         /////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
class iletisimSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim Bilgileri'),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Firma Bilgilerimiz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Firma Adı: Mert Yazılım Hizmetleri A.Ş.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Adres:  Huzur Mh. Maslak Ayazağa Cd. No:4B UNIQ, 34485 Sarıyer/İstanbul',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Text(
              'İletişim Bilgileri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Telefon: +90 534 631 33 23',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'E-posta: yigitlerhaliyikama@gmail.com',
              style: TextStyle(fontSize: 18),
            ),SizedBox(height: 30,),
            Text(
              'Sosyal Medya: 🌐mertaygt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                '© 2024 Tüm Hakları Saklıdır.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
class redPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Oto Yıkama Hizmetleri', style:TextStyle(color: Colors.black, fontStyle: FontStyle.italic),),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            buildImageCard(context, 'assets/images/oto1.png', '1453 Oto Yıkama(Suadiye)', () {
              showInfoDialog(context, 'Araç Yıkama Ücreti 200 TL ');


              print('Firma 1 tıklandı');
            }),
            buildImageCard(context, 'assets/images/oto2.jpg', 'Aktaş Oto Temizlik(Kartal) ', () {
              showInfoDialog(context, 'Araç Yıkama Ücreti 350 TL ');

              print('Firma 2 tıklandı');
            }),
            buildImageCard(context, 'assets/images/oto3.jpg', 'Yıldız Premium Car Care(Pendik)', () {
              showInfoDialog(context, 'Araç Yıkama Ücreti 140 TL ');

              print('Firma 3 tıklandı');
            }),
            buildImageCard(context, 'assets/images/oto4.jpg', 'Eyüp Car Wash(Sultangazi)', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');

              print('Firma 4 tıklandı');
            }),
            buildImageCard(context, 'assets/images/ortak.jpg', 'Yeriniz Hazır!', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');

              print('Firma 5 tıklandı');
            }),
            buildImageCard(context, 'assets/images/ortak.jpg', 'Sizi Burada Görmek İsteriz', () {
              showInfoDialog(context, 'Çok Yakında Başvurular Başlıyor');

              print('Firma 6 tıklandı');
            }),
          ],
        ),
      ),
    );
  }
  void showInfoDialog(BuildContext context, String firmName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(firmName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Detaylar İçin Lütfen İletişime Geçiniz'),
              Text(""),
              Text('Hizmet Tarihi: Firma Oluşturuyor'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sipariş verildi')),
                );
              },
              child: Text('MİSAFİR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('MODUNDASINIZ'),
            ),
          ],
        );
      },
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hizmetlerimiz Çoğalacak!!!', style: TextStyle(color: Colors.black26),),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            buildImageCard(context, 'assets/images/yakinda.png', 'Çok Yakında...', () {

              print('Firma 5 tıklandı');
            }),
            buildImageCard(context, 'assets/images/yakinda.png', 'Çok Yakında...', () {

              print('Firma 6 tıklandı');
            }),
            buildImageCard(context, 'assets/images/yakinda.png', 'Çok Yakında...', () {

              print('Firma 7 tıklandı');
            }),
            buildImageCard(context, 'assets/images/yakinda.png', 'Çok Yakında...', () {

              print('Firma 8 tıklandı');
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Geri', style: TextStyle(fontSize: 12)),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
