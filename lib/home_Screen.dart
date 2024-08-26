import 'package:flutter/material.dart';

import 'Models/ProductsModel.dart';
import 'api_Provider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsModel? productslist;
  bool isloading = true;
  getproductsFromApiProvider() async {
    productslist = await Apiprovider().getProduct();
    print("**************************");
    print("products***${productslist?.products?[0].title}");
    print("**************************");
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getproductsFromApiProvider();

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
            Text("Home"),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Search"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: isloading == true
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
                        itemCount: productslist!.products!.length))
          ],
        ),
      ),
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
