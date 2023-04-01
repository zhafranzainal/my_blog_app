import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_blog_app/bloc/user_bloc.dart';
import 'package:my_blog_app/models/login_request_model.dart';
import 'package:my_blog_app/models/user_response_model.dart';
import 'package:my_blog_app/screens/home_page/home_page.dart';
import 'package:my_blog_app/screens/register_page/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserBloc loginBloc = UserBloc();
  LoginRequestModel loginRequestModel = LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Form(
              key: _formKey,
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
                    onSaved: (newValue) {
                      loginRequestModel.email = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      icon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    onSaved: (newValue) {
                      loginRequestModel.password = newValue;
                    },
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          loginProcess(loginRequestModel);
                        }
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
          ),
        ));
  }

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<void> loginProcess(LoginRequestModel loginRequestModel) async {
    UserResponseModel responseModel = await loginBloc.login(loginRequestModel);

    if (responseModel.isSuccess) {
      // set access token
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("access_token", responseModel.data!.accessToken!);

      // if successful
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } else {
      // unsuccessful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseModel.message),
        ),
      );
    }
  }
}
