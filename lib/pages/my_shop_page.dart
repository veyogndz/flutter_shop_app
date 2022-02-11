import 'package:flutter/material.dart';
import 'package:flutter_shop_app/pages/basket_page.dart';

class MyShopPage extends StatelessWidget {
  final List<Image> myProducts = [
    Image.asset('assets/red.jpg'),
    Image.asset('assets/white.jpg'),
    Image.asset('assets/book.jpg')
  ];
  final List<Text>myDress  =[
    const Text("Red Hat!",style: TextStyle(
      fontSize: 20
    ),),
    const Text("White Tshirt",style: TextStyle(
        fontSize: 20
    ),),
    const Text("Book",style: TextStyle(
        fontSize: 20
    ),),

  ];

  MyShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        actions: [
          DropdownButton<String>(
            items: <String>['Only Favorites', 'Show All'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BasketPage()));
          }, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 64,
              child: DrawerHeader(
                child: Text(
                  "Hello Friends! ",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shop_rounded),
              title: const Text('Shop'),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyShopPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.reorder_sharp),
              title: const Text('Orders'),
              onTap: () {
                // Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop_rounded),
              title: const Text('Manage Products'),
              onTap: () {
                // Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Navigator.pushNamed(context, "/");
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext context, index) {
            return Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: myProducts[index],
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(onPressed: () {},
                    icon: const Icon(Icons.favorite_border , size: 30,)),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomCenter,
                  child: myDress[index]
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: () {},
                      icon: const Icon(Icons.shopping_cart,size: 30,)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
/*
Container(
    color: Colors.black54,
    alignment: Alignment.bottomCenter,
    child: const Text(
      "data",
      style: TextStyle(color: Colors.white),
    ),
  ),
 */