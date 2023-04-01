import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_blog_app/screens/home_page/home_page.dart';
import 'package:my_blog_app/screens/register_page/register_page.dart';

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
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MyBlog",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Design Own Blog",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Text("Login")),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
