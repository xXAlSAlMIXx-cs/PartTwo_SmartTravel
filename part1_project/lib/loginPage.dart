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
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40,90,40,200),
                      child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)

                            ),

                            child: Form(

                                                  child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14),

                                child: TextFormField(
                                  decoration: InputDecoration(labelText: 'Username'),
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your username'
                                      : null,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter your password'
                                    : null,
                              ),
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Login'),
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
