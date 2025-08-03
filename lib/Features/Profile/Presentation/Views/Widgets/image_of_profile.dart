import 'package:flutter/material.dart';

class ImageOfProfile extends StatelessWidget {
  const ImageOfProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullImage(context),
      child: ClipOval(
        child: Image.asset(
          'assets/images/ali.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  void _showFullImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: InteractiveViewer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/ali.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
