
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widget.dart';
import 'package:firebase_core/firebase_core.dart';

final _password = TextEditingController();
final _passwordBaru = TextEditingController();
final _konPass = TextEditingController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: List(),
    );
  }
}

class PasswordPage extends StatelessWidget {
  PasswordPage({Key? key, required this.id} ) : super(key: key);
  String id;

  void handleCreatePass() async {
   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('akun').where('password', isEqualTo: _password.text).get();
   if (querySnapshot.docs.isNotEmpty) {
     String id = querySnapshot.docs[0].id;
     final updatedData = {
       'password': _passwordBaru.text
     };
     FirebaseFirestore.instance.collection('akun').doc(id).update(updatedData);
   }
  }

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
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon : Icon(Icons.arrow_back_outlined), iconSize: 24, color: Colors.white,),
                                SizedBox(width: 96,),
                                Text("Ubah Password", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),)
                              ]
                          )
                      ),
                      Container(
                        height: 800,
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
                              controller: _password,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Password Baru", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: _passwordBaru,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 12,),
                            Text("Konfirmasi Password Baru", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                            TextField(
                              controller: _konPass,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                  )),
                            ),
                            SizedBox(height: 345,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (_konPass.text == _passwordBaru.text) {
                                    handleCreatePass();
                                  }
                                  Navigator.pop(context);
                                },
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
  void handleUpdateProfil(String id, String _nama, String _email, String _alamat, String _hp) {
    final newProfile = {
      'nama' : _nama,
      'email' : _email,
      'alamat' : _alamat,
      'hp' : _hp,
    };
    FirebaseFirestore.instance.collection('akun').doc(id).update(newProfile);
  }

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
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon : Icon(Icons.arrow_back_outlined), iconSize: 24, color: Colors.white,),
                                  SizedBox(width: 84,),
                                  Text("Ubah Profil", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),),
                                ]
                            )
                          ],
                        ),
                      ),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('akun').snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState==ConnectionState.waiting) {
                              return Text("Mohon Tunggu");
                            }
                            if (!snapshot.hasData) {
                              return Text("Tidak ada data");
                            }
                            String _nama = snapshot.data!.docs[0].data() ['nama'];
                            String _email = snapshot.data!.docs[0].data() ['email'];
                            String _alamat = snapshot.data!.docs[0].data() ['alamat'];
                            String _hp = snapshot.data!.docs[0].data() ['hp'];
                            String id = snapshot.data!.docs[0].id;
                            return Container(
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
                                    controller: TextEditingController(text: _nama),
                                    onChanged: (newValue) {
                                      _nama = newValue;
                                    },
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 12,),
                                  Text("Email", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                                  TextField(
                                    controller: TextEditingController(text: _email),
                                    onChanged: (newValue) {
                                      _email = newValue;
                                    },
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 12,),
                                  Text("Alamat", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                                  TextField(
                                    controller: TextEditingController(text: _alamat),
                                    onChanged: (newValue) {
                                      _alamat = newValue;
                                    },
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 12,),
                                  Text("Nomor Telepon", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA)),),
                                  TextField(
                                    controller: TextEditingController(text: _hp),
                                    onChanged: (newValue) {
                                      _hp = newValue;
                                    },
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 176,),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        handleUpdateProfil(id, _nama, _email, _alamat, _hp);
                                      },
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
                                  )
                                ],
                              ),
                            );
                          }
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
  Info({Key? key, required this.id}) : super(key: key);
  final _textEditingController = TextEditingController();
  String id;
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
                                SizedBox(width: 50,),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context)=>Profil())
                                    );
                                  },
                                  icon : Icon(Icons.brush_outlined), iconSize: 27, color: Colors.white,),
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
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('akun').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState==ConnectionState.waiting) {
                                  return Text("Mohon Tunggu");
                                }
                                if (!snapshot.hasData) {
                                  return Text("Tidak ada data");
                                }
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 36,),
                                      Text("Nama Lengkap", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                      SizedBox(height: 8,),
                                      Text(snapshot.data!.docs[0].data() ['nama'], style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                      SizedBox(height: 16,),
                                      Text("Email", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                      SizedBox(height: 8,),
                                      Text(snapshot.data!.docs[0].data() ['email'], style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                      SizedBox(height: 16,),
                                      Text("Nomor Telepon", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                      SizedBox(height: 8,),
                                      Text(snapshot.data!.docs[0].data() ['hp'], style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                      SizedBox(height: 16,),
                                      Text("Alamat", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.grey)),
                                      SizedBox(height: 8,),
                                      Text(snapshot.data!.docs[0].data() ['alamat'], style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                      SizedBox(height: 16,),
                                      Container(width: 335, height: 1, color: Colors.grey,),
                                      SizedBox(height: 16,),
                                      Text("Keamanan", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                      SizedBox(height: 16,),
                                      Row(children: [
                                        Text("Ubah Password", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.black)),
                                        SizedBox(width: 178,),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PasswordPage(id: snapshot.data!.docs[0].id))
                                            );
                                          },
                                          icon: Icon(Icons.arrow_forward_ios), iconSize: 24,)
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
                                );
                              }
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

  void handleCreateProduct(String _nameProduct, String _desProduct, String _catProduct, String _harga, String _jumlah, String _durasi, String _berat) {
    final newProduct = {
      'nama' : _nameProduct,
      'jum' : _jumlah,
      'harga' : _harga,
      'durasi' : _durasi,
      'des' : _desProduct,
      'cat' : _catProduct,
      'berat' : _berat,
      'status' : "Proses"
    };
    FirebaseFirestore.instance.collection('produk').doc().set(newProduct);
  }
  
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
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon : Icon(Icons.arrow_back_outlined), iconSize: 24, color: Colors.white,),
                                SizedBox(width: 96,),
                                Text("Kirim Permintaan", style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.white),)
                              ]
                          )
                      ),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('produk').snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState==ConnectionState.waiting) {
                              return Text("Mohon Tunggu");
                            }
                            if (!snapshot.hasData) {
                              return Text("Tidak ada data");
                            }
                            final _nameProduct = TextEditingController();
                            final _desProduct = TextEditingController();
                            final _catProduct = TextEditingController();
                            final _harga = TextEditingController();
                            final _jumlah =TextEditingController();
                            final _durasi = TextEditingController();
                            final _berat = TextEditingController();
                            return Container(
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
                                    controller: _nameProduct,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 11,),
                                  Text("Deskripsi Produk", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                                  TextField(
                                    controller: _desProduct,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 11,),
                                  Text("Kategori", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                                  TextField(
                                    controller: _catProduct,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 11,),
                                  Text("Harga", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                                  TextField(
                                    controller: _harga,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 11,),
                                  Text("Jumlah", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                                  TextField(
                                    controller: _jumlah,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 11,),
                                  Text("Durasi Tahan", style: TextStyle(fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: Colors.black),),
                                  TextField(
                                    controller: _durasi,
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
                                    controller: _berat,
                                    decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide:  BorderSide(color: Color(0xFFE1E1E1), width: 1)
                                        )),
                                  ),
                                  SizedBox(height: 41,),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        handleCreateProduct(_nameProduct.text, _desProduct.text, _catProduct.text, _harga.text, _jumlah.text, _durasi.text, _berat.text);
                                      },
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
                                    ),
                                  )
                                ],
                              ),
                            );

                          }
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
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('produk').snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState==ConnectionState.waiting) {
                                return Text("Mohon Tunggu");
                              }
                              if (!snapshot.hasData) {
                                return Text("Tidak ada data");
                              }
                              return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20
                                  ),
                                child:  GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 30,
                                      childAspectRatio: 0.9,
                                    ),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var document = snapshot.data!.docs[index];
                                      return KotakPro(nama: document.data() ['nama'], status: document.data() ['status'], id: document.id);
                                    }
                                )

                              );
                            },
                          )

                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:  Stack(
                          children: [
                            StreamBuilder(
                                stream: FirebaseFirestore.instance.collection('akun').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState==ConnectionState.waiting) {
                                    return Text("Mohon Tunggu");
                                  }
                                  if (!snapshot.hasData) {
                                    return Text("Tidak ada data");
                                  }
                                  return Footer2(id: snapshot.data!.docs[0].id);
                                })

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


