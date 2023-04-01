import 'package:flutter/material.dart';
import 'package:my_blog_app/bloc/user_bloc.dart';
import 'package:my_blog_app/models/default_response_model.dart';
import 'package:my_blog_app/models/register_request_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpController = TextEditingController();

  UserBloc registerBloc = UserBloc();
  RegisterRequestModel registerRequestModel = RegisterRequestModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Colors.blue,
        ),
        title: Text(
          "Registration",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    registerRequestModel.name = newValue;
                  },
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "Name",
                    icon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    registerRequestModel.email = newValue;
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
                    registerRequestModel.password = newValue;
                  },
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  onSaved: (newValue) {
                    registerRequestModel.passwordConfirmation = newValue;
                  },
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                    icon: Icon(Icons.lock),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (validateAndSave()) {
                        registerProcess(registerRequestModel);
                      }
                    },
                    child: Text("Sign Up")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<void> registerProcess(
      RegisterRequestModel registerRequestModel) async {
    DefaultResponseModel responseModel =
        await registerBloc.register(registerRequestModel);

    if (responseModel.isSuccess) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("register successful")));
      print("register success");
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(responseModel.message)));
    }
  }
}
