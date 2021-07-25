import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Obx(() {
          if (controller.isLoading.value == true) {
            return Column(children: <Widget>[
              Row(
                children: [
                  Text(
                    "Loading ...",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
              Container(
                height: 120,
                width: 120,
                child: Image.asset("assets/images/loading_inf.gif"),
              )
            ]);
          } else {
            return Container(
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 400,
                      child: Card(
                          child: Column(
                        children: [
                          SizedBox(height: 14),
                          Image.asset("assets/images/avatar_icon.png"),
                          SizedBox(height: 14),
                          Text(
                            controller.user.value.email,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      height: 380,
                      child: Card(
                        child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Text(
                                    "Personal information:",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "E-mail:",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(controller.user.value.email),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Name:",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(controller.user.value.name),
                                ],
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20))),
                        child: Center(
                          child: Text("Logout"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
