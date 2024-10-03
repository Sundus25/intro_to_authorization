
import 'package:auth_project1/service/auth_api.dart';
import 'package:flutter/material.dart';

class MyinfoPage extends StatelessWidget {
  const MyinfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getMyInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.email);
            } else if (snapshot.hasError) {
              return Text( snapshot.error.toString() );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
