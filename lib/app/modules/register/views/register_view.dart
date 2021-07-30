import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register to APP'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/images/registerimage.png"),
                  ),
                ),
                Card(
                  child: Container(
                    // width: 400,
                    // height: 400,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "Tell me something about you:",
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: controller.registerFormKey,
                          child: Container(
                            child: Obx(() {
                              // print(controller.validationErrors.value["errors"]["email"][0]);
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        errorText: controller.validationErrors.value.containsKey("email") ? controller.validationErrors.value["email"][0] : null ,
                                        icon: Icon(
                                            Icons.alternate_email_outlined),
                                        hintText: "Please provide your email"),
                                    maxLength: 50,
                                    controller: controller.emailController,
                                    onChanged: (value) {controller.validationErrors(<String,dynamic>{});},
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
                                        errorText: controller.validationErrors.value.containsKey("name") ? controller.validationErrors.value["name"][0] : null ,
                                        icon: Icon(Icons
                                            .supervised_user_circle_outlined),
                                        hintText: "Please provide your name"),
                                    maxLength: 50,
                                    onChanged: (value) {controller.validationErrors(<String,dynamic>{});},
                                    keyboardType: TextInputType.text,
                                    controller: controller.nameController,
                                    onSaved: (value) {
                                      controller.name = value!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        errorText: controller.validationErrors.value.containsKey("password") ? controller.validationErrors.value["password"][0] : null ,
                                        icon: Icon(Icons.password),
                                        hintText: "Please enter password"),
                                    maxLength: 50,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controller.passwordController,
                                    onChanged: (value) {controller.validationErrors(<String,dynamic>{});},
                                    onSaved: (value) {
                                      controller.password = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validatePassword(value!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        errorText: controller.validationErrors.value.containsKey("password") ? controller.validationErrors.value["password"][0] : null ,
                                        icon: Icon(Icons.password_rounded),
                                        hintText:
                                            "Please confirm your password"),
                                    maxLength: 50,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    onChanged: (value) {controller.validationErrors(<String,dynamic>{});},
                                    controller: controller
                                        .passwordConfirmationController,
                                    onSaved: (value) {
                                      controller.passwordConfirmation = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validatePasswordConfirmation(value!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressButton.icon(
                                      iconedButtons: {
                                        ButtonState.idle: IconedButton(
                                            text: "Send",
                                            icon: Icon(Icons.send,
                                                color: Colors.white),
                                            color: Colors.deepPurple.shade500),
                                        ButtonState.loading: IconedButton(
                                            text: "Loading",
                                            color: Colors.deepPurple.shade700),
                                        ButtonState.fail: IconedButton(
                                            text: "Failed",
                                            icon: Icon(Icons.cancel,
                                                color: Colors.white),
                                            color: Colors.red.shade300),
                                        ButtonState.success: IconedButton(
                                            text: "Success",
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                            ),
                                            color: Colors.green.shade400)
                                      },
                                      onPressed: () {
                                        controller.checkRegister();
                                      },
                                      state: controller.buttonState.value)
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
