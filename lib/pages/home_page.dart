import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.9,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Istanbul , Turkey',
          style: GoogleFonts.notoSerif(),
        ),
        centerTitle: false,
        actions: const [
          HeadingWidget(),
        ],
      ),
      floatingActionButton: const MainFloatActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          // good morning bro
          headerOne(),
          const SizedBox(height: 4),
          // Let's order fresh items for you
          headerItems(),

          const SizedBox(height: 24),

          const DividerWidget(),

          const SizedBox(height: 24),

          // categories -> horizontal listview
          freshItems(),

          const GridViewWidget(),
        ],
      ),
    );
  }

  Padding headerOne() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Text('Günaydın !'),
    );
  }

  Padding headerItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        "Alışverişe Başlayabilirsiniz..",
        style: GoogleFonts.notoSerif(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding freshItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        "Taze Ürünler",
        style: GoogleFonts.notoSerif(
          //fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CartModel>(builder: (context, value, child) {
        return GridView.builder(
            itemCount: value.shopItems.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
            ),
            itemBuilder: (context, index) {
              return GroceryItemTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  onPressed: () => Provider.of<CartModel>(context, listen: false).addItemToCart(index),
                  color: value.shopItems[index][3]);
            });
      }),
    );
  }
}

class MainFloatActionButton extends StatelessWidget {
  const MainFloatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const CardPage();
          },
        ),
      ),
      child: const Icon(Icons.shopping_bag),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Divider(),
    );
  }
}
