import 'package:e_commerce_app/Features/Profile/Presentation/Views/Widgets/image_of_profile.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Views/Widgets/list_view_of_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Opacity(opacity: .5, child: Text('Profile')),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            ImageOfProfile(),
            const SizedBox(height: 20),
            ListViewOfListTile(),
          ],
        ),
      ),
    );
  }
}
