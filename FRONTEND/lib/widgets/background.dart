import 'package:flutter/material.dart';

Widget background(BuildContext context, child) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey,
          ),
        ],
      ),
      child
    ],
  );
}
