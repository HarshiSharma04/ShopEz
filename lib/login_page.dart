import 'package:flutter/material.dart';
import 'package:shopez/home_page.dart';
import 'package:shopez/signup_age.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WELCOME !',
              style: TextStyle(color: Color(0xFFBD1F1F), fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Login to continue',
              style: TextStyle(color: Color(0xFFBD1F1F), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'or',
              style: TextStyle(color: Color(0xFFBD1F1F), fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Create a new account'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFFBD1F1F),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_2_outlined, color: Colors.white,),
                filled: true,
                fillColor: Color(0xFFBD1F1F),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password_rounded, color: Colors.white,),
                filled: true,
                fillColor: Color(0xFFBD1F1F),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('LOGIN', style: TextStyle(fontSize: 20)),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFBD1F1F),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Color(0xFFBD1F1F)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
