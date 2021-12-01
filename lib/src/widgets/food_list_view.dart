import 'package:flutter/material.dart';
import '../model/puntos.dart';
import '../ui/detail/widget/detail.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Puntos local;
  FoodListView(this.selected, this.callback, this.pageController, this.local);

  @override
  Widget build(BuildContext context) {
    final category = local.locales.keys.toList();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) => callback(index),
          children: category
              .map((e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (contex, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(
                                local.locales[category[selected]]![index])));
                      },
                      child:
                          FoodItem(local.locales[category[selected]]![index])),
                  separatorBuilder: (_, index) => SizedBox(height: 15),
                  itemCount: local.locales[category[selected]]!.length))
              .toList(),
        ));
  }
}
