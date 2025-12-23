import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  void signup() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Signup Successful"),
        backgroundColor: Colors.green,
      ),
    );
  }

  InputDecoration _inputStyle(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade700),
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      filled: true,
      fillColor: Colors.white,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF6BC6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 12,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      /// LOGO / ICON
                      const CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.person_add,
                            color: Colors.white, size: 34),
                      ),

                      const SizedBox(height: 16),

                      /// TITLE
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Sign up to get started",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// NAME
                      TextFormField(
                        controller: nameCtrl,
                        decoration:
                        _inputStyle("Full Name", Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name required";
                          }
                          if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                            return "Only alphabets allowed";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      /// EMAIL
                      TextFormField(
                        controller: emailCtrl,
                        decoration:
                        _inputStyle("Email Address", Icons.email),
                        validator: (value) {
                          if (value == null ||
                              !RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      /// MOBILE
                      TextFormField(
                        controller: phoneCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(color: Colors.grey.shade700),
                          prefixText: "+92 ",
                          prefixStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(Icons.phone, color: Colors.blueAccent),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter mobile number";
                          }

                          // user sirf 3XXXXXXXXX likhe
                          if (!RegExp(r'^3\d{9}$').hasMatch(value)) {
                            return "Enter valid Pakistani number";
                          }

                          return null;
                        },
                      ),

                      /// PASSWORD
                      TextFormField(
                        controller: passCtrl,
                        obscureText: true,
                        decoration:
                        _inputStyle("Password", Icons.lock),
                        validator: (value) {
                          if (value == null ||
                              !RegExp(
                                  r'^(?=.*[A-Za-z])(?=.*\d)')
                                  .hasMatch(value)) {
                            return "Must be alphanumeric";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      /// CONFIRM PASSWORD
                      TextFormField(
                        controller: confirmPassCtrl,
                        obscureText: true,
                        decoration: _inputStyle(
                            "Confirm Password",
                            Icons.lock_outline),
                        validator: (value) {
                          if (value != passCtrl.text) {
                            return "Password not match";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: signup,
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
      ),
    );
  }
}
