import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/product_item_of_cart_view.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_elevated_button_of_product.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Opacity(opacity: .7, child: Text('Your Cart')),
            Opacity(
              opacity: .5,
              child: Text(
                '3 items',
                style: Style().textStyle16,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    background: FirstContainerOfDismissible(),
                    secondaryBackground: SecondContainerOfDismissible(),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        // cartItems.removeAt(index);
                      });
                    },
                    child: ProductItemOfCartView()),
              ),
            ),
            Container(
              height: 103,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Text('Total: \$1200', style: Style().textStyle18),
                  MyElevatedButtonOfProduct(
                    text: 'Checkout   Total: \$1200',
                    minimumSize: Size(200, 54),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondContainerOfDismissible extends StatelessWidget {
  const SecondContainerOfDismissible({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class FirstContainerOfDismissible extends StatelessWidget {
  const FirstContainerOfDismissible({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
