import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String? name;
  final String? sex;
  const ProfilePage({Key? key, @queryParam this.name, @queryParam this.sex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text("Profile Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: $name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.brown[900]),
            ),
            const SizedBox(height: 20),
            Text(
              " Sex: $sex",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
