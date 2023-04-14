import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.black12,
      child: const Center(
        child: Text("Не получилось загрузить"),
      ),
    );
  }
}
