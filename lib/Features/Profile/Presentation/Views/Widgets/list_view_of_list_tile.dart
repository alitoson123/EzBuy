import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Features/Profile/Data/Models/ProfileModel.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Views/Widgets/list_tile_of_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewOfListTile extends StatelessWidget {
  ListViewOfListTile({super.key});

  final List<Profilemodel> profileModelList = [
    Profilemodel(
      title: 'My Account',
      leadingIcon: Icons.person,
      onTap: (context) {
        GoRouter.of(context).push(Navigate.KMyAccountPage);
      },
    ),
    Profilemodel(
        title: 'My Account', leadingIcon: Icons.person, onTap: (context) {}),
    Profilemodel(
        title: 'My Account', leadingIcon: Icons.person, onTap: (context) {}),
    Profilemodel(
        title: 'My Account', leadingIcon: Icons.person, onTap: (context) {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profileModelList.length,
        itemBuilder: (context, index) =>
            ListTileOfProfile(profilemodelObject: profileModelList[index]),
      ),
    );
  }
}
