import 'package:flutter/material.dart';

import '../Models/ProductsModel.dart';
import '../api_Provider.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  bool isloading = true;

  ProductsModel? productslist;

  fetchg() async {
    productslist = await Apiprovider().groceries();

    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://www.shutterstock.com/image-vector/product-release-icon-vector-sign-260nw-1902949900.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Groceries"),
          ],
        ),
      ),
      body: isloading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  buildItems(products: productslist!.products![index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 4),
    );
  }

  Widget buildItems({final Product? products}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(products!.thumbnail.toString()),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products.title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(products.category!.toString()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
                Text(products.price.toString()),
              ],
            )
          ],
        )
      ],
    );
  }
}
