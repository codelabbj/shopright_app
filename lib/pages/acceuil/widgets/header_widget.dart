import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/logo/srtc.png",
          width: 50,
          height: 50,
          color: Colors.black,
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/marketplace1.png",
              width: 22,
              height: 22,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(Icons.notifications_none, size: 28),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.yellow,
                  child: Text("6", style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/clothe.jpeg'),
              radius: 18,
            )
          ],
        )
      ],
    );
  }
}
