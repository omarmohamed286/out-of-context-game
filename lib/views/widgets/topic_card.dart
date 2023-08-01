import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(color: Colors.amberAccent),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
