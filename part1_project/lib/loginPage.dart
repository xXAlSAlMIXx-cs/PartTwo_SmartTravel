import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900] ?? Colors.deepOrange,
          Colors.orange[600] ?? Colors.orange,
          Colors.orange[300] ?? Colors.orangeAccent
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)

                        ),
                              ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 90, 40, 200),
                      child: Expanded(
                          child: Container(
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400,
                                            spreadRadius: 8,
                                            blurRadius: 10,
                                            offset: Offset(4, 4))
                                      ]),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    labelText: 'UserName',
                                          filled: true,
                                          fillColor: Colors.grey[200], // background color like in the image
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10), // rounded border
                                            borderSide: BorderSide(color: Colors.deepPurple),), // border color
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple, width: 2),
                                    ),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400,
                                            spreadRadius: 8,
                                            blurRadius: 10,
                                            offset: Offset(4, 4))
                                      ]),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    labelText: 'Password',
                                          filled: true,
                                          fillColor: Colors.grey[200], // background color like in the image
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10), // rounded border
                                            borderSide: BorderSide(color: Colors.deepPurple),), // border color)
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Colors.deepPurple, width: 2),
                                    ),
                                  )),
                                ),
                              ),


                              SizedBox(height: 30),
                              SizedBox(

                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange, // Button background color
                                    foregroundColor: Colors.white,  // Text (label) color
                                    padding: EdgeInsets.symmetric(vertical: 16), // Optional: makes it taller
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // Optional: rounded corners
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    )))
          ],
        ),
      ),
    );
  }
}
