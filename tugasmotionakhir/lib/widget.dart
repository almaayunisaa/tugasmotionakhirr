import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/home.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/har.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/trans.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/pro.png', width: 24, height: 24,),
            ],
          ),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Beranda", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(width: 37,),
              Text("Produk", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(width: 41,),
              Text("Riwayat", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(width: 46,),
              Text("Profil", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF17C118)),),
            ],
          ),
        ],
      ),
    );
  }
}
class Footer2 extends StatelessWidget {
  const Footer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/home.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/har.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/trans.png', width: 24, height: 24,),
              SizedBox(width: 67,),
              Image.asset('assets/pro.png', width: 24, height: 24,),
            ],
          ),
          SizedBox(height: 4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Beranda", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(width: 37,),
              Text("Produk", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF17C118)),),
              SizedBox(width: 41,),
              Text("Riwayat", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
              SizedBox(width: 46,),
              Text("Profil", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
            ],
          ),
        ],
      ),
    ),
        Positioned(
            right: 183,
            bottom :20,
            child: Icon(Icons.add_circle, size: 54, color: Color(0xFF62C172),))
      ],
    );
  }
}
class KotakPro extends StatelessWidget {
  const KotakPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 189,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFFD1F3D1),
      ),
      child: Column(
        children: [
          SizedBox(height: 5,),
          Center(
            child: Image.asset('assets/broko.png', scale: 4,),
          ),
          Container(
              height: 96.5,
              width: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11,),
                   Text("Brokoli", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),),
                  SizedBox(height: 5.64,),
                  Text("Proses", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: Color(0xFFF99500)),),
                  SizedBox(height: 9,),
                  Row(
                    children: [
                      SizedBox(width: 75),
                      Container(
                        width: 68,
                        height: 27.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Color(0xFF74DA84),
                        ),
                        child: Center(child: Text("Detail", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: Colors.white),)),
                      )
                    ],
                  )
          ],))

        ],
      ),
    );
  }
}

