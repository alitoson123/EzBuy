import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class TheCounterOfCartView extends StatelessWidget {
  const TheCounterOfCartView({
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
            radius: 14,
            backgroundColor: const Color.fromARGB(101, 158, 158, 158),
            child: Icon(
              Icons.remove,
              size: 22,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 5),
          Text(
            '1',
            style: Style()
                .textStyle18
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
