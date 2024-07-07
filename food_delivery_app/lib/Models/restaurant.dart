import "package:flutter/material.dart";

import "./food.dart";

class Restaurant extends ChangeNotifier
{
  final List<Food> _menu = [

    //Burgers.
    Food(name: "Beef Burger", description: "Feel the taste of juicy patty", imagePath: "images/Burgers/beef_burger.jpg", price: 2.5, category: FoodCategory.burgers, availableAddons: [Addon(name: "Extra petty", price: 0.99)]),
    Food(name: "Cheese Burger", description: "Let the cheese spread in the mouth", imagePath: "images/Burgers/cheese_burger.jpg", price: 2.5, category: FoodCategory.burgers, availableAddons: [Addon(name: "Extra Cheese", price: 0.99)]),
    Food(name: "Chicken Burger", description: "Crispy chicken patty", imagePath: "images/Burgers/chicken_burger.jpg", price: 2.5, category: FoodCategory.burgers, availableAddons: [Addon(name: "Extra petty", price: 0.99)]),


    //Desserts.
    Food(name: "Black Forest Cake", description: "Yummy as Yummy", imagePath: "images/Desserts/black_forest_cake.jpg", price: 2.5, category: FoodCategory.desserts, availableAddons: [Addon(name: "Extra Chocolate", price: 0.99)]),
    Food(name: "Ice Cream Browny", description: "Browny with a ice cream helmet", imagePath: "images/Desserts/ice_cream_browny.jpg", price: 2.5, category: FoodCategory.desserts, availableAddons: [Addon(name: "Extra Chocolate", price: 0.99)]),
    Food(name: "Cherry Cup Cake", description: "Mini cake with red spots", imagePath: "images/Desserts/cherry_cup_cake.jpg", price: 2.5, category: FoodCategory.desserts, availableAddons: [Addon(name: "Extra Cherry", price: 0.99)]),

    //Salads.
    Food(name: "Bean Salad", description: "Bean filled salad", imagePath: "images/Salads/bean_salad.jpg", price: 2.5, category: FoodCategory.salads, availableAddons: [Addon(name: "Extra Beans", price: 0.99)]),
    Food(name: "Greek Salad", description: "Greeky fellas", imagePath: "images/Salads/greek_salad.jpg", price: 2.5, category: FoodCategory.salads, availableAddons: [Addon(name: "Extra Beans", price: 0.99)]),
    Food(name: "Russian Salad", description: "Putin's effect", imagePath: "images/Salads/russian_salad.jpg", price: 2.5, category: FoodCategory.salads, availableAddons: [Addon(name: "Extra Beans", price: 0.99)]),

    //Sides.
    Food(name: "Corn", description: "Crispy hot corn", imagePath: "images/Sides/corn.jpg", price: 2.5, category: FoodCategory.sides, availableAddons: [Addon(name: "Extra Corn", price: 0.99)]),
    Food(name: "Fries", description: "Frieeeeessss", imagePath: "images/Sides/fries.jpg", price: 2.5, category: FoodCategory.sides, availableAddons: [Addon(name: "Extra Fries", price: 0.99)]),
    Food(name: "Steamed Vegetables", description: "Steamy vegies baby", imagePath: "images/Sides/steamed_vegetables.jpg", price: 2.5, category: FoodCategory.sides, availableAddons: [Addon(name: "Extra Vegetables", price: 0.99)]),


    //Drinks.
    Food(name: "Berries Shake", description: "Berries all over", imagePath: "images/Drinks/berries_shake.jpg", price: 2.5, category: FoodCategory.drinks, availableAddons: [Addon(name: "Extra berries", price: 0.99)]),
    Food(name: "Cream Caramel Shake", description: "Crearamel", imagePath: "images/Drinks/cream_caramel_shake.jpg", price: 2.5, category: FoodCategory.drinks, availableAddons: [Addon(name: "Extra Cream", price: 0.99)]),
    Food(name: "Dark Chocoloate Shake", description: "Go Dark", imagePath: "images/Drinks/dark_chocolate_shake.jpg", price: 2.5, category: FoodCategory.drinks, availableAddons: [Addon(name: "Extra Dark Chocolate", price: 0.99)]),
  ];

  //Getters.
  List<Food> get menu => _menu;

  //Setters.

  //Add to cart.

  //Remove from cart.

  //Total price.
}