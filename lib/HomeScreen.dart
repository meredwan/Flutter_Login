import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  void login(String email, name) async {
    try {
      Response response = await post(
          Uri.parse("https://kejubayer.com/api/login"),
          body: {'email': email, 'password': name});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("login successfull");
      } else {
        print("Login failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LOGIN"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: "Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (() {
                  login(emailcontroller.text.toString(),
                      namecontroller.text.toString());
                }),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: const Center(
                    child: Text("LOGIN"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
