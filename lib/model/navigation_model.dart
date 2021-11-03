import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Profile", icon: Icons.person_pin_outlined),
  NavigationModel(title: "Addresses", icon: Icons.location_on),
  NavigationModel(title: "Vouchers", icon: Icons.local_offer),
  NavigationModel(title: "My Orders", icon: Icons.history),
  NavigationModel(title: "My Cart", icon: Icons.shopping_bag),
  NavigationModel(title: "Sign out", icon: Icons.logout),
];