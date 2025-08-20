import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class TheCounter extends StatelessWidget {
  const TheCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color.fromARGB(101, 158, 158, 158),
            child: Icon(
              Icons.remove,
              size: 28,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 5),
          Text(
            '1',
            style: Style()
                .textStyle20
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
