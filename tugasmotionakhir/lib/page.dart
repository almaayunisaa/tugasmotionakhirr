import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'widget.dart';

void main() {
  runApp(const Run());
}

class Run extends StatelessWidget {
  const Run({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: List(),
    );
  }
}

class PasswordPage extends StatelessWidget {
  PasswordPage({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                          color: Color(0xFF62C172),
                          height: 86,
                          width: double.infinity,
                          child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.arrow_back_outlined, size: 24, color: Colors.white,),
                                SizedBox(width: 96,),
                                Text("Ubah Password", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),)
                              ]
                          )
                      ),
                      Container(
                        height: 900,
                        width: double.infinity,
                        color: Color(0xFFF3FAF3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 36,),
                            Text("Password Lama", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: _textEditingController,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Password Baru", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: _textEditingController,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Konfirmasi Password Baru", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: _textEditingController,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 345,),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF74DA74),
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                width: 164,
                                height: 48,
                                child: Center(
                                    child: Text("Simpan", style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.white),)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Profil extends StatelessWidget {
  Profil({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF62C172),
                          boxShadow:[
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 86,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.arrow_back_outlined, size: 24, color: Colors.white,),
                                  SizedBox(width: 84,),
                                  Text("Ubah Profil", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),),
                                ]
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFF3FAF3)
                        ),
                        width: double.infinity,
                        height: 800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Colors.grey[300],
                                  child: Icon(Icons.camera_alt_outlined, color: Colors.white,),
                                )
                              ],
                            ),
                            SizedBox(height: 32,),
                            Text("Nama Lengkap", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: TextEditingController(text: "Natalie Diva"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Email", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: TextEditingController(text: "nataliediva@gmail.com"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Alamat", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: TextEditingController(text: "Jl. Sukapura No. 03"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Nomor Telepon", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: TextEditingController(text: "0812 3456 7890"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 176,),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF74DA74),
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                width: 164,
                                height: 48,
                                child: Center(
                                    child: Text("Simpan", style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.white),)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                          color: Color(0xFF62C172),
                          height: 160,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/defpic.png'),
                                  radius: 40.0,
                                ),
                                SizedBox(width: 24,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 54,),
                                    Text("Natalie", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Poppins', color: Colors.white, )),
                                    SizedBox(height: 8,),
                                    Text("nataliediva@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: Colors.white, )),
                                  ],
                                ),
                                SizedBox(width: 77,),
                                Icon(Icons.brush_outlined, size: 27, color: Colors.white,),
                              ]
                          )
                      ),
                      Container(
                          width: double.infinity,
                          height: 600,
                          color: Color(0xFFF3FAF3),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 36,),
                                Text("Nama Lengkap", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                SizedBox(height: 8,),
                                Text("Natalie", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                SizedBox(height: 16,),
                                Text("Email", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                SizedBox(height: 8,),
                                Text("gamil.com", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                SizedBox(height: 16,),
                                Text("Nomor Telepon", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                SizedBox(height: 8,),
                                Text("08xxxxx", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                SizedBox(height: 16,),
                                Text("Alamat", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                SizedBox(height: 8,),
                                Text("Jl.", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                SizedBox(height: 16,),
                                Container(width: 335, height: 1, color: Colors.grey,),
                                SizedBox(height: 16,),
                                Text("Keamanan", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                SizedBox(height: 16,),
                                Row(children: [
                                  Text("Ubah Password", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                  SizedBox(width: 178,),
                                  Icon(Icons.arrow_forward_ios, size: 24,)
                                ],),
                                SizedBox(height: 16,),
                                Container(width: 335, height: 1, color: Colors.grey,),
                                SizedBox(height: 52,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout_outlined, size: 24, color: Color(0xFF129B29),),
                                    SizedBox(width: 16,),
                                    Text("Logout Akun", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFF129B29))),
                                  ],
                                ),
                              ]
                          )
                      ),
                      Footer()
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Produk extends StatelessWidget {
  Produk({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                          color: Color(0xFF62C172),
                          height: 86,
                          width: double.infinity,
                          child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(Icons.arrow_back_outlined, size: 24, color: Colors.white,),
                                SizedBox(width: 96,),
                                Text("Kirim Permintaan", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),)
                              ]
                          )
                      ),
                      Container(
                        height: 900,
                        width: double.infinity,
                        color: Color(0xFFF3FAF3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3,),
                            Text("Foto Produk", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 8,),
                            Container(
                              width: 76,
                              height: 72,
                              color: Colors.white,
                              child: Center(child : Icon(Icons.camera_alt_outlined)),
                            ),
                            SizedBox(height: 8,),
                            Text("Nama Produk", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "Sayur Singkong"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Deskripsi Produk", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "Produk fresh dan menyenangkan."),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Kategori", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "Sayuran"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Harga", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "Rp50.000"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Jumlah", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "1"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Durasi Tahan", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            TextField(
                              controller: TextEditingController(text: "2-4 hari"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 11,),
                            Text("Berat", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Dalam", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black),),
                                SizedBox(width: 5,),
                                Text("gram", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFF17C118)),),
                                SizedBox(width: 5,),
                                Text("(contoh: 500 gr untuk 1 ikat)", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                              ],
                            ),
                            TextField(
                              controller: TextEditingController(text: "500"),
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 41,),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF74DA74),
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                width: double.infinity,
                                height: 52,
                                child: Center(
                                    child: Text("Kirim", style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.white),)
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
class List extends StatelessWidget {
  List({Key? key}) : super(key: key);
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      Container(
                          color: Color(0xFF62C172),
                          height: 136,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 34,),
                              Text("List Produk", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Poppins', color: Colors.white),),
                              SizedBox(height: 18,),
                              Container(
                                width: double.infinity,
                                height: 40,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(child:
                                    TextField(
                                      controller: _textEditingController,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(border : InputBorder.none, hintText: 'Cari Produk'),
                                    ),
                                    ),
                                    Icon(Icons.search, color: Colors.grey,),
                                  ],
                                )
                              )
                            ],
                          )
                      ),
                      Container(
                          width: double.infinity,
                          height: 600,
                          color: Color(0xFFF3FAF3),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               KotakPro()
                              ]
                          )
                      ),
                      Stack(
                        children: [
                          Footer2(),
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}


