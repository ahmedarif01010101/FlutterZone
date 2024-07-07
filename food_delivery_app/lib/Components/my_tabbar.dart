import "package:flutter/material.dart";
import "package:food_delivery_app/Models/food.dart";

class MyTabBar extends StatelessWidget
{
  final TabController tabController;

  MyTabBar({required this.tabController});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: TabBar(
        isScrollable: true,
        controller: tabController,
        tabs: _tabs()
        ),
    );
  }
 
 List<Tab> _tabs ()
 {
    return FoodCategory.values.map((category){
        return Tab(
          text: category.toString().split(".").last.toUpperCase());
    }).toList();
 }

}