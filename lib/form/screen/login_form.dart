import 'package:flutter/material.dart';
import 'package:task/form/controller/Login_controller.dart';
import 'package:task/travel/screen/travel.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // static TextEditingController userNameController = TextEditingController();
  // static TextEditingController passwordController = TextEditingController();

  static bool isLoading = false;

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });

      await LoginController.login();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Travel()));
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: LoginController.username,
              decoration: const InputDecoration(labelText: "Username"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: LoginController.password,
              decoration: const InputDecoration(labelText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: const Text("Login")),
          )
        ],
      ),
    );
  }
}
