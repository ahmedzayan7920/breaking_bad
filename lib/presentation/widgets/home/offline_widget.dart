import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/offline.png",
          ),
          const Text(
            "No Internet Connection Please check your Network",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
