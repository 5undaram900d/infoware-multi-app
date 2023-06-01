
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  String name;
  String email;

  MyDrawer({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.green.shade700,
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.profile_circled, size: 80,),
                Text(name.toString(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                Text(email.toString()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}
