import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Text(
            "Произошла ошибка. Потяните, чтобы перезагрузить",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w800),
          ),
    );
  }
}
