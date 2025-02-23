import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/favourti_provider.dart';
import 'package:todo_app/views/fav_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<FavourtiProvider>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                print("tap");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FavView()));
              },
              child: const Badge(
                alignment: Alignment.centerRight,
                // ignore: sort_child_properties_last
                child: Icon(Icons.shopping_bag),
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                for (int i = 0; i < 20; i++)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      leading: Text(i.toString()),
                      // ignore: unrelated_type_equality_checks
                      trailing: InkWell(
                        onTap: () {
                          getProvider.setFav(i);
                          // ignore: avoid_print
                          print(getProvider.fav);
                        },
                        // ignore: unrelated_type_equality_checks
                        child: getProvider.fav.contains(i)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                      ),
                    ),
                  )
              ],
            )),
          ],
        ));
  }
}
