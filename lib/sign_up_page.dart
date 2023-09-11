import 'package:flutter/material.dart';
import 'package:page_view_bug/app_theme_data.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  bool agreeTerms = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.labelMedium!;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // First Name Form
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        firstName = value;
                      });
                    },
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),

                  // Last Name Form
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),

                  // Email Form
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),

                  // Password Form
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),

                  // Agreement Row
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'I agree with the Service Terms and the Privacy Policy',
                          style: textStyle,
                        ),
                      ),
                      Checkbox(
                        value: agreeTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeTerms = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Login Button (Full Width)
                  SizedBox(
                    width: double.infinity,
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: gold,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform the login action here
                            // print('Email: $email, Password: $password');
                          } else {
                            _showErrorDialog('Invalid email or password');
                          }
                        },
                        minWidth: 200.0, // Set a minimum width
                        height: 50.0,
                        child: Text(
                          'Sign Up',
                          style: textStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // "Or Use" Text
                  Text(
                    'Or use',
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  // Social Media Buttons (Google, Facebook, Apple)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialMediaButton(icon: Icons.g_mobiledata),
                      SizedBox(width: 10),
                      SocialMediaButton(icon: Icons.facebook),
                      SizedBox(width: 10),
                      SocialMediaButton(icon: Icons.apple),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // "I Don't Have an Account" Text
                  GestureDetector(
                    onTap: () {
                      // Add your 'create account' action here
                    },
                    child: Text(
                      "I have an account",
                      style: textStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;

  const SocialMediaButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: gold,
      radius: 20,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
