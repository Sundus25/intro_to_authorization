import 'package:auth_project1/model/user_model.dart';
import 'package:auth_project1/service/auth_api.dart';
import 'package:auth_project1/view/myinfo_page.dart';

import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "asset/photo_2024-10-03_10-43-46.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 290,
              ),
              const Text(
                "LogIn",
                style: TextStyle(
                  color: Color(0XFF6a185a),
                  fontSize: 37,
                  fontFamily: 'Merienda',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Please enter your name and your password ",
                style: TextStyle(
                  color: Color(0XFF8d77b7),
                  fontSize: 15,
                  fontFamily: 'Merienda',
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: "UserName",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: 'Merienda',
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 23,
                    color: Color(0XFF6a185a),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: 'Merienda',
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    size: 23,
                    color: Color(0XFF6a185a),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF6a185a),
                    shadowColor: const Color(0XFF8d77b7),
                    minimumSize: const Size(200, 50)),
                onPressed: () async {
                  bool status = await login(UserModel(
                      username: username.text, password: password.text));
                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Success"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyinfoPage(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Failed"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Merienda',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
