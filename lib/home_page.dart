import 'package:flutter/material.dart';
import 'package:shopez/account_info.dart';
import 'package:shopez/cart_page.dart';
import 'package:shopez/scanner_page.dart';



class HomePage extends StatefulWidget {

  const HomePage({ super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentMall = 'Delhi Mart'; // Initial mall name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBD1F1F),
        title: Text('    SHOPEZ',
            style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold, )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
                " Checkout at your fingertips",
                style: TextStyle(fontSize: 16, color: Colors.white, )
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0x900B0B).withOpacity(0.8),
          child: ListView(
            children: [
              ListTile(
                title: Text("MENU", style: TextStyle(color: Colors.white,  fontSize: 30, fontWeight: FontWeight.bold)),
                onTap: (){},
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.account_circle_outlined, size: 32, color: Colors.white,),
                title: Text("Account Info", style: TextStyle(color: Colors.white, fontSize: 23)),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountInfo()),
                  );
                },
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.history, size: 32, color: Colors.white),
                title: Text("Payment History", style: TextStyle(color: Colors.white,  fontSize: 23)),
                onTap: (){},
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.local_offer_outlined, size: 32, color: Colors.white),
                title: Text("Offers", style: TextStyle(color: Colors.white,  fontSize: 23)),
                onTap: (){},
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.help_outline_rounded, size: 32, color: Colors.white),
                title: Text("Help", style: TextStyle(color: Colors.white, fontSize: 23)),
                onTap: (){},
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: 32, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 23)),
                onTap: (){},
              ),
              Divider(color: Colors.white),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 20,),
              Image.asset(
                'lib/images/homepage.jpg',
                height: 300,
              ),
              SizedBox(height: 15,),
              Text(
                "Currently Shopping in",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  // Show dialog or bottom sheet to change mall
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select Mall', style: TextStyle(fontSize: 20),),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              GestureDetector(
                                child: Text('Mall 1',style: TextStyle(fontSize: 20),),
                                onTap: () {
                                  setState(() {
                                    currentMall = 'Mall 1';
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              GestureDetector(
                                child: Text('Mall 2'),
                                onTap: () {
                                  setState(() {
                                    currentMall = 'Mall 2';
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              // Add more mall options here
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 28),
                      Text(currentMall, style: TextStyle(fontSize: 20),),
                      SizedBox(width: 28),
                      Text(
                        'Change',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFBD1F1F),
                ),
              ),
              SizedBox(height: 20,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1.5,
                    width: double.infinity,
                    color: Color(0xFF900b0b),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF900b0b),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(23),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BarcodeScannerPage()),
                            );


                          },
                          iconSize: 70,
                          color: Colors.white,
                        ),
                          Text(
                            "Scan to Start",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),



                ],
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
                child: Container(
                  width: 350,
                  height: 100,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFBD1F1F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.shopping_cart, color: Colors.white, ),
                          SizedBox(width: 10,),
                          Text(
                            'GO TO CART',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text('pick where you left from',
                        style: TextStyle(color: Colors.white, fontSize: 18),)
                    ],
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
