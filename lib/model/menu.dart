import 'package:flutter/material.dart';
import 'package:advicebee_page/home.dart';
import 'package:advicebee_page/pages/main_page.dart';
import 'package:advicebee_page/pages/topic.dart';

class Menu {
  String title;
  IconData icon;
  MaterialPageRoute route;

  Menu({this.title, this.icon, this.route});
}

List<Menu> menuItems = [
  Menu(
      title: "Dashboard",
      icon: Icons.dashboard,
      route: MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
  Menu(
      title: "User",
      icon: Icons.account_circle,
      route: MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
  Menu(
      title: "Topic",
      icon: Icons.book,
      route: MaterialPageRoute(
        builder: (context) => Topic(),
      )),
  Menu(
      title: "Group",
      icon: Icons.supervised_user_circle,
      route: MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
  Menu(
      title: "Point",
      icon: Icons.assessment,
      route: MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
  Menu(
      title: "Report",
      icon: Icons.report,
      route: MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
];
