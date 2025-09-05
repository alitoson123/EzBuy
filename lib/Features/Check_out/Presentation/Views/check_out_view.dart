import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/number_of_items.dart';
import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Opacity(opacity: .7, child: Text('Check Out')),
            Opacity(
              opacity: .5,
              child: NumberOfItems(),
            ),
          ],
        ),
      ),
      body: CheckOutViewBody(),
    );
  }
}
