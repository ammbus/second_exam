import 'package:flutter/material.dart';
import 'package:second_exam/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: LoginWidget()));
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  void _loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
      setState(() {
        rememberMe = true;
      });
    }
  }

  void _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
    }
  }

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    // Perform login logic
    print('Email: $email, Password: $password');

    // Save credentials if remember me is checked
    _saveCredentials();

    // Navigate to Home Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home_screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 50, 77, 1),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          child: Stack(
            children: <Widget>[
              // Positioned circle avatar at the top
              Positioned(
                top: 60,
                left: 110,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Color.fromRGBO(255, 248, 201, 1),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/intersect.png'),
                  ),
                ),
              ),
              // Other elements
              Positioned(
                top: 189,
                left: 36,
                child: Container(
                  width: 288,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(217, 217, 217, 1),
                    border: Border.all(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      width: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 276,
                left: 76,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color.fromRGBO(10, 50, 77, 1),
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                top: 302,
                left: 67,
                child: Container(
                  width: 226,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(119, 193, 193, 0.75),
                    border: Border.all(
                      color: Color.fromRGBO(27, 47, 108, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Example@gmail.com',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(27, 47, 108, 1),
                        ),
                      ),
                      style: TextStyle(
                        color: Color.fromRGBO(27, 47, 108, 1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 379,
                left: 76,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Color.fromRGBO(10, 50, 77, 1),
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                top: 405,
                left: 67,
                child: Container(
                  width: 226,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(119, 193, 193, 0.75),
                    border: Border.all(
                      color: Color.fromRGBO(27, 47, 108, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(27, 47, 108, 1),
                        ),
                      ),
                      style: TextStyle(
                        color: Color.fromRGBO(27, 47, 108, 1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 498,
                left: 73,
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        color: Color.fromRGBO(10, 50, 77, 1),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 645,
                left: 39,
                child: GestureDetector(
                  onTap: _login,
                  child: Container(
                    width: 283,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 234, 205, 1),
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromRGBO(10, 50, 77, 1),
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 735,
                left: 58,
                child: GestureDetector(
                  onTap: () {
                    // Handle sign up tap
                  },
                  child: Text(
                    'Don’t have an account ?   Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
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

