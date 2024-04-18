import 'package:flutter/material.dart';
import 'package:shopez/login_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(
        Duration(seconds: 10),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text('Welcome to ', style: TextStyle(color: Color(0xFF9D1010) , fontWeight: FontWeight.bold, fontSize: 30, ),),
            SizedBox(height: 15,),
            Text('ShopEz', style: TextStyle(color: Color(0xFF9D1010), fontWeight: FontWeight.bold, fontSize: 30,),),
            Image.asset(
              'lib/images/splashscreen.webp',
              height: 200,
            ),
          ],
        )
    );
  }
}
