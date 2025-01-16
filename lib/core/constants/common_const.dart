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
    MySkills(name: 'html5', image: 'assets/html5.png'),
    MySkills(name: 'css', image: 'assets/css3.png'),
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
      subtitle: '',
      urlOnGitHub: 'https://github.com/rostikKalabishka/ai_chat',
    ),
    MyProject(
      image: 'assets/project_image/crypto_app.jpg',
      name: 'CryptoApp',
      subtitle:
          'This Flutter-based cryptocurrency portfolio application allows users to manage their digital assets, view live data from the CoinGecko API, and store their portfolio securely in Firebase. The app supports Google authorization for easy user login and profile management.',
      urlOnGitHub: 'https://github.com/rostikKalabishka/CryptoApp',
    ),
    // MyProject(
    //   image: '',
    //   name: 'WebRTCProject',
    //   subtitle: '',
    //   urlOnGitHub: 'https://github.com/rostikKalabishka/web_webrtc_project',
    // ),
    MyProject(
      image: 'assets/project_image/ai_chat.png',
      name: 'instx',
      subtitle: '',
      urlOnGitHub: 'https://github.com/rostikKalabishka/instx',
    ),
    MyProject(
      image: 'assets/project_image/echo_notes.jpg',
      name: 'EchoNotes',
      subtitle: '',
      urlOnGitHub: 'https://github.com/rostikKalabishka/EchoNotes',
    ),
    MyProject(
      image: 'assets/project_image/re_anime.png',
      name: 'ReAnime',
      subtitle: '',
      urlOnGitHub: 'https://github.com/rostikKalabishka/ReAnime',
    )
  ];

  static List<MyContact> myContact = [];
}
