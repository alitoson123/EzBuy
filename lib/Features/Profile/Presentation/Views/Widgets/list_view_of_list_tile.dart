import 'package:e_commerce_app/Features/Profile/Data/Models/ProfileModel.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Views/Widgets/list_tile_of_profile.dart';
import 'package:flutter/material.dart';

class ListViewOfListTile extends StatefulWidget {
  const ListViewOfListTile({super.key});

  @override
  State<ListViewOfListTile> createState() => _ListViewOfListTileState();
}

class _ListViewOfListTileState extends State<ListViewOfListTile> {
  List<Profilemodel> profileModelList = [
    Profilemodel(title: 'My Account', leadingIcon: Icons.person),
    Profilemodel(title: 'My Account', leadingIcon: Icons.person),
    Profilemodel(title: 'My Account', leadingIcon: Icons.person),
    Profilemodel(title: 'My Account', leadingIcon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: profileModelList.length,
        itemBuilder: (context, index) => ListTileOfProfile(
            profilemodelObject: profileModelList[index]),
      ),
    );
  }
}
