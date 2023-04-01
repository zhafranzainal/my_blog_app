import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Name",
                  icon: Icon(Icons.person),
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
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Confirm Password",
                  icon: Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
      ),
    );
  }
}
