import 'package:flutter/material.dart';
import 'package:my_portfolio/core/model/my_contact.dart';
import 'package:my_portfolio/core/model/my_skills.dart';

abstract class CommonConst {
  static const List<String> headerItems = [
    'Home',
    'Skills',
    'Projects',
    'Contacts'
  ];

  static const List<IconData> navIcons = [
    Icons.home,
    Icons.handyman_outlined,
    Icons.apps,
    Icons.quick_contacts_mail,
  ];

  static List<MySkills> mySkills = [
    MySkills(name: 'Flutter', image: ''),
    MySkills(name: 'TypeScript', image: ''),
    MySkills(name: 'NestJS', image: ''),
    MySkills(name: 'Dart', image: ''),
    MySkills(name: 'JS', image: '')
  ];

  static List<MyContact> myContact = [];
}
