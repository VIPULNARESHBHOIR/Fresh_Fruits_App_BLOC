import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/MyProducts/ui/productsView.dart';
import 'package:grocery/features/home/ui/home.dart';
import 'package:grocery/features/login/login.dart';

class ShoppingType extends StatelessWidget {
  final String username;
  const ShoppingType({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // Extends body behind AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 2,
        title: SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(

            backgroundColor: Colors.blue,

            child: Text('${username[0].toUpperCase()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),

        actions: [

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen()));
            },
            child: Text('Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Button background color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(50), // Rounded corners
              ),
              elevation: 5, // Shadow effect
            ),
          ),
          SizedBox(width: 10,)],

      ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 135, 243, 33), Color.fromARGB(255, 0, 110, 221)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 280,
                  height: 80,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PaginationScreen()));
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/cart_2312969.png',
                              width: 40, height: 40),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buy Products',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                letterSpacing: 0.4,
                                fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      elevation: 8,
                      backgroundColor: Color(0xDB003D59),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),

              SizedBox(

                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: 280,
                  height: 80,
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/fruits_11615356.png',
                              width: 40, height: 40),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buy Fruits',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                letterSpacing: 0.4,
                                fontFamily: 'Raleway'),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      elevation: 8,
                      backgroundColor: Color.fromARGB(255, 0, 54, 23),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
