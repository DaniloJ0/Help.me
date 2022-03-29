import 'package:flutter/material.dart';

Widget customAppBar() {
  return Row(
    children: [Expanded(flex: 1, child: appBar())],
  );
}

Widget appBar() {
  return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => null,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ));
}