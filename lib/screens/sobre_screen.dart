import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Made by: Lucas',
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 1.5, fontSize: 26.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Contact:',
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 1.5, fontSize: 25.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Email:\nlucas.goncalves35@aluno.unip.br',
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 1.1, fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
