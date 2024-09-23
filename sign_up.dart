import 'package:acil_temizlik/firmaSign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/purple2.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customSizedBox1(),
                      Text(
                        "Şifrenizi Güçlü Belirleyiniz!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      customSizedBox1(),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Bilgileri Eksiksiz Doldurunuz";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                        decoration: InputDecoration(
                          hintText: "E-Mail",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      customSizedBox(),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Bilgileri Eksiksiz Doldurunuz";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Şifre",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: Column(
                          children: [


                            Container(
                              height: 50,
                              width: 150,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.redAccent,
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState!.save();
                                    try {
                                      var userResult = await firebaseAuth.createUserWithEmailAndPassword(
                                          email: email, password: password);
                                      print(userResult.user!.uid);
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  }
                                },
                                child: Text(
                                  "Kaydol",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              height: 50,
                              width: 150,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.redAccent,
                              ),
                              child: TextButton(
                                onPressed: () => Navigator.pushNamed(context, "/loginPage"),
                                child: Text(
                                  "Geri Dön",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),



                            ),
                             SizedBox(height: 10,),
                             TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => firmaPage()));
                              },
                              child: Text(
                                "Firma İseniz Tıklayınız!!!",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customSizedBox1() => SizedBox(height: 10);
  Widget customSizedBox() => SizedBox(height: 20);
}
