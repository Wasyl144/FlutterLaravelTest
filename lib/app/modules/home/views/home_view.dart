import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:laraveltest/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login to app'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(8),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: Image.asset("assets/images/loading_inf.gif"),
                );
              }
              return SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.loginFormKey,
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/login_image.jpg"),
                      SizedBox(
                        width: 40,
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.person)),
                        obscureText: false,
                        maxLength: 50,
                        controller: controller.emailController,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: Icon(Icons.password)),
                        obscureText: true,
                        maxLength: 50,
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordController,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          controller.checkLogin();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20))),
                        child: Center(
                          child: Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
