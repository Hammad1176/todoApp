import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/favourti_provider.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<FavourtiProvider>(context, listen: false);
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: getProvider.fav.length,
                itemBuilder: (context, index) {
                  return Text(getProvider.fav[index].toString());
                }))
      ],
    );
    // return
  }
}
