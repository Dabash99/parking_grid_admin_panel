import 'package:flutter/material.dart';
import 'package:parking_grid_admin/modules/GET/getScreen.dart';
import 'package:parking_grid_admin/modules/postScreen.dart';
import 'package:parking_grid_admin/shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Admin Panel'),
      body: Column(
        children: [
          cutomContianer(context,
              imagePath: 'assets/images/get.png',
              colorside: Colors.green,
              text: 'get',widget: GetScreen()
             ),
          cutomContianer(context,
              imagePath: 'assets/images/mail.png',
              colorside: Colors.yellow,
              text: 'Post',widget: PostScreen()
              ),
          cutomContianer(context,
              imagePath: 'assets/images/database.png',
              colorside: Colors.red,
              text: 'Delete',widget: PostScreen()
          )
        ],
      ),
    );
  }
}
