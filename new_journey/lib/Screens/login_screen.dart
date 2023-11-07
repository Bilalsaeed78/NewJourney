import 'package:flutter/material.dart';
import '../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _userType = "buyer";
  bool _passwordVisible = false;

  String _emailErrorText = "";
  String _passwordErrorText = "";

  bool isEmailValid(String email) {
    if (email.isEmpty ||
        !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*$').hasMatch(email)) {
      return false;
    }
    return true;
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || !isEmailValid(email)) {
      setState(() {
        _emailErrorText = "Invalid email format.";
      });
    } else {
      setState(() {
        _emailErrorText = "";
      });
    }

    if (password.isEmpty) {
      setState(() {
        _passwordErrorText = "Password is required.";
      });
    } else {
      setState(() {
        _passwordErrorText = "";
      });
    }

    if (_emailErrorText.isEmpty && _passwordErrorText.isEmpty) {
      RouteManager.goToDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Image.asset(
                'assets/fyplogo.png',
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                "Login to Your Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  if (_emailErrorText.isNotEmpty)
                    Text(
                      _emailErrorText,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "buyer",
                          groupValue: _userType,
                          onChanged: (value) {
                            setState(() {
                              _userType = value!;
                            });
                          },
                        ),
                        title: Text("Buyer",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "owner",
                          groupValue: _userType,
                          onChanged: (value) {
                            setState(() {
                              _userType = value!;
                            });
                          },
                        ),
                        title: Text("Owner",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: !_passwordVisible,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 8),
              if (_passwordErrorText.isNotEmpty)
                Text(
                  _passwordErrorText,
                  style: TextStyle(color: Colors.red),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add logic for "Forgot Password"
                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 66, 66, 66),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Login"),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  RouteManager.navigateToRegistrationScreen();
                },
                child: Text(
                  "Don't have an account? Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
