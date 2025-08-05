import 'package:e_commerce_app/Features/Profile/Data/Models/ProfileModel.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class ListTileOfProfile extends StatelessWidget {
  const ListTileOfProfile(
      {super.key, required this.profilemodelObject,});
  final Profilemodel profilemodelObject;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        minTileHeight: 70,
        onTap: () => profilemodelObject.onTap(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Color(0xffF0F2F4),
        leading: Icon(
          profilemodelObject.leadingIcon,
          color: KPrimaryColor,
        ),
        title: Text(profilemodelObject.title, style: Style().textStyle16),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
