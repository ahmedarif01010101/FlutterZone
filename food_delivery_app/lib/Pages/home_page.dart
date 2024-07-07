import "package:flutter/material.dart";
import "package:food_delivery_app/Components/my_current_location.dart";
import "package:food_delivery_app/Components/my_description.dart";
import "package:food_delivery_app/Components/my_drawer.dart";
import "package:food_delivery_app/Components/my_silver_app_bar.dart";
import "package:food_delivery_app/Components/my_tabbar.dart";
import "package:food_delivery_app/Models/food.dart";
import "package:food_delivery_app/Models/restaurant.dart";
import "package:food_delivery_app/Pages/food_page.dart";
import "package:provider/provider.dart";
import "package:food_delivery_app/Components/food_tile.dart";
class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState()
  {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
            drawer: MyDrawer(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            body: NestedScrollView(
              headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                MySilverAppBar(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                         //My current location.
                          MyCurrentLocation(),

                         //My descriptive box.
                         MyDescription()
                    ],), 
                  title: MyTabBar(tabController: _tabController,)),

              ]),
              body: Consumer<Restaurant> (builder:(context, value, child) => TabBarView(
                controller: _tabController,
                children: _getFoodInThisCategory(value.menu)))
            ),
    );
  }

  List<Food> _filterMenuByCategory(List<Food> fullmenu, FoodCategory category)
  {
    return fullmenu.where((food) => food.category == category).toList();
  }

  List<Widget> _getFoodInThisCategory(List<Food> fullmenu)
  {
    return FoodCategory.values.map((category){
      List<Food> category_menu = _filterMenuByCategory(fullmenu, category);
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: category_menu.length,
        itemBuilder: (context, index) => FoodTile(
          food: category_menu[index],
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage(food: category_menu[index],)));
          })
        
      );
    }).toList();
  }
}