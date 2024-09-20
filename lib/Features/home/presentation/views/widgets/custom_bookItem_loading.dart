import 'package:flutter/material.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[50], borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
