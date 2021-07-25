import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserView'),
        centerTitle: true,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            controller.test();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              padding: MaterialStateProperty.all(EdgeInsets.all(20))),
          child: Center(
            child: Text("test"),
          ),
        ),
      ),
    );
  }
}
