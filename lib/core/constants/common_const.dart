import 'package:flutter/material.dart';
import 'package:my_portfolio/core/model/my_contact.dart';
import 'package:my_portfolio/core/model/my_project.dart';
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
    MySkills(name: 'HTML5', image: 'assets/html5.png'),
    MySkills(name: 'CSS3', image: 'assets/css3.png'),
    MySkills(name: 'Flutter', image: 'assets/flutter.png'),
    MySkills(name: 'Dart', image: 'assets/dart.png'),
    MySkills(name: 'JS', image: 'assets/javascript.png'),
    MySkills(name: 'TypeScript', image: 'assets/typescript.png'),
    MySkills(name: 'NestJS', image: 'assets/nestjs.png'),
  ];

  static List<MyProject> myProject = [
    MyProject(
      image: 'assets/project_image/ai_chat.png',
      name: 'AiChat',
      subtitle:
          'AiChat is a chatbot application built with Flutter, utilizing advanced AI technologies to provide seamless and interactive user experiences. Perfect for learning and experimentation.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/ai_chat',
    ),
    MyProject(
      image: 'assets/project_image/crypto_app.jpg',
      name: 'CryptoApp',
      subtitle:
          'This Flutter-based cryptocurrency portfolio application allows users to manage their digital assets, view live data from the CoinGecko API, and store their portfolio securely in Firebase. The app supports Google authorization for easy user login and profile management.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/CryptoApp',
    ),
    MyProject(
      image: 'assets/project_image/ai_chat.png',
      name: 'instx',
      subtitle:
          'Instx is a simple and intuitive Instagram-like application built with Flutter. It supports photo sharing, basic user interactions, and minimalistic design for a smooth user experience.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/instx',
    ),
    MyProject(
      image: 'assets/project_image/echo_notes.jpg',
      name: 'EchoNotes',
      subtitle:
          'EchoNotes is a note-taking application built with Flutter. It includes voice-to-text functionality, allowing users to create and organize notes efficiently. A perfect tool for productivity.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/EchoNotes',
    ),
    MyProject(
      image: 'assets/project_image/re_anime.png',
      name: 'ReAnime',
      subtitle:
          'ReAnime is a Flutter application designed for anime enthusiasts. It helps users discover new shows, track watched episodes, and stay updated with the latest releases.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/ReAnime',
    ),
  ];

  static List<MyContact> myContact = [
    MyContact(
      image: 'assets/github.png',
      name: 'github',
      url: 'https://github.com/rostikKalabishka',
    ),
    MyContact(
      image: 'assets/telegram.png',
      name: 'telegram',
      url: 'https://t.me/.@RostikKalabishka',
    ),
    MyContact(
      image: 'assets/linkedin.png',
      name: 'linkedin',
      url: 'https://www.linkedin.com/in/rostyslav-kalabishka-2b48312a5/',
    ),
    MyContact(
      image: 'assets/instagram.png',
      name: 'instagram',
      url: 'https://www.instagram.com/rostikkk.kkkk',
    ),
  ];
}
