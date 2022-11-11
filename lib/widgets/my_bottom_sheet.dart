import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final String text;
  final Widget icon;
  const MyBottomSheet({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          //color: Colors.pink,
          border: Border(
            top: BorderSide(
              width: 1.5,
              color: Theme.of(context).textTheme.caption!.color ?? Colors.black,
            ),
            bottom: BorderSide(
              width: 1.5,
              color: Theme.of(context).textTheme.caption!.color ?? Colors.black,
            ),
          ),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 2),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
