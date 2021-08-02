import 'package:journey_into_get_management/constants/controllers.dart';
import 'package:journey_into_get_management/screens/home/widgets/maps.dart';

import 'package:journey_into_get_management/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: "journey_into_get_management",
          size: 18,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Santos"), accountEmail: Text("asb@asn.com")),
            ListTile(
              onTap: () {
                authController.signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Obx(() => Stack(
            children: [
              appController.activeDraggableWidget.value,
              Positioned(
                  top: 10,
                  right: 45,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: () {
                            Get.to(() => MapWidget());
                          })))
            ],
          )),
    );
  }
}
