import 'package:flutter/material.dart';
import 'package:part1_project/models/user_model.dart';
import 'package:part1_project/pages/profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900] ?? Colors.deepOrange,
              Colors.orange[600] ?? Colors.orange,
              Colors.orange[300] ?? Colors.orangeAccent
            ],
          ),
        ),
        child: Column(
          children: [
            // Header section
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Main content area with white background
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),

                          // Username input
                          buildInputField(
                            controller: _usernameController,
                            labelText: 'Username',
                            isPassword: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          // Password input
                          buildInputField(
                            controller: _passwordController,
                            labelText: 'Password',
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),

                          // Login button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 3,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Create user model with input data
                                  final user = UserModel(
                                    username: _usernameController.text,
                                    email: '${_usernameController.text}@example.com',
                                  );
                                  
                                  // Return the user and pop the login page
                                  Navigator.pop(context, user);
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          // Forgot password link
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Forgot password logic
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.orange[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
    required String? Function(String?) validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: Icon(
            isPassword ? Icons.lock_outline : Icons.person_outline,
            color: Colors.orange[700],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange[700]!, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
} 