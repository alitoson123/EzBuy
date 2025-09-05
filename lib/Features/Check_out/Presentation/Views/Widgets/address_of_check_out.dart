import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class AddressOfCheckOut extends StatelessWidget {
  const AddressOfCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Your ِAddress',
              style: Style().textStyle20,
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Color(0xff1E88E5),
              ),
            ),
          ],
        ),
        Opacity(
          opacity: .5,
          child: Text(
            'Cairo - Nasr city - 2nd Street - 2nd floor - Building 1 - Room 1',
            style: Style().textStyle16,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
