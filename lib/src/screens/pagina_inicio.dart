import 'package:flutter/material.dart';

class PaginaDeInicio extends StatelessWidget {
  const PaginaDeInicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('images/logo.png'),
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'by SagraSoft',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
