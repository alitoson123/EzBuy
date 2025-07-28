import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class TextFieldForHome extends StatefulWidget {
  const TextFieldForHome({super.key});

  @override
  State<TextFieldForHome> createState() => _TextFieldForHomeState();
}

class _TextFieldForHomeState extends State<TextFieldForHome> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {}); // Rebuild to change icon color
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        height: 50,
        child: TextField(
          focusNode: focusNode,
          cursorColor: KPrimaryColor,
          onSubmitted: (value) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffECECEC),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyle(color: KPrimaryColor),
            prefixIcon: Icon(
              Icons.search,
              color: focusNode.hasFocus ? KPrimaryColor : Colors.grey,
            ),
            hintText: 'Search for products',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: borderOutLineInputBorder(),
            focusedBorder: focusOutLineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder borderOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.white),
    );
  }

  OutlineInputBorder focusOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
