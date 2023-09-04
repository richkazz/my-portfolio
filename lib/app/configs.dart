import 'package:flutter/material.dart';

import '../core/models/project.dart';
import '../core/models/skill_display.dart';
import '../core/models/skill_model.dart';
import '../core/models/technologies.dart';
import '../core/models/timeline_experience.dart';
import 'icons.dart';

//*Social Media Links
mixin SocialLinks {
  static const String linkedinUrl =
      'https://www.linkedin.com/in/karo-edaware-39b1171b2/';
  static const String mediumLink = 'https://medium.com/@edawarekaro';
  static const String twitterLink = 'https://twitter.com/EdawareRichard';
  static const String githubLink = 'https://github.com/richkazz';
  static const String facebookLink = 'https://web.facebook.com/karo.edaware';
  static const String instagramLink = 'https://www.instagram.com';
  static const String telegramLink = 'https://t.me/';
}

//*System Defaults
mixin SystemProperties {
  static const String fontName = 'Montserrat';
  static const String titleFont = 'Lato';
}

//*Education Details
mixin EducationDetails {
  static const String collegeName = 'Powerfield College';
  static const String collegeTimeline = '2019 - 2021';
  static const String schoolName = 'Powerfield High School';

  static const String schoolTimeline = '2015 - 2019';
  static const String universityName = 'Lagos State University';
  static const String universityTimeline = '2021 - present';

  static const String universityStream = 'Computer Science and Engineering';
  static const String schoolStream = 'Stream 2';
  static const String collegeStream = 'Fulltime';

  static const double universityPercentage = 75.4;
  static const double schoolPercentage = 95.2;
  static const double collegePercentage = 93;
}

//*Personal details
mixin PersonalDetails {
  static const String myName = 'Oghenekaro Edaware';
  static const String myLogo = 'assets/images/sk_logo.png';
  static const List<SkillDisplay> skillDisplayList = [
    SkillDisplay(
        title: 'Mobile Application Developement',
        color: Color(0xFFE2A599),
        iconData: SkillDisplayIcons.appIcon),
    SkillDisplay(
        title: 'Full Stack Web Developement',
        color: Color(0xFF5E57BB),
        iconData: SkillDisplayIcons.websiteIcon),
    SkillDisplay(
        title: '.NET Development',
        color: Color(0xFFE45447),
        iconData: SkillDisplayIcons.mlIcon),
    SkillDisplay(
        title: 'Database Management',
        color: Color(0xFFFFB300),
        iconData: SkillDisplayIcons.databaseIcon)
  ];
  static const String resumeLink =
      'https://drive.google.com/file/d/1UDKbgeY8Kc8jqqGu1xMTnN1QVfbp6mui/view?usp=sharing';
  static const String whatsappLink = 'https://wa.me/7052858840';
  static const List<Technologies> techList = [
    Technologies(icon: TechnologiesIcon.dotNetIcon, name: '.NET Core'),
    Technologies(icon: TechnologiesIcon.javaIcon, name: 'Java'),
    Technologies(icon: TechnologiesIcon.pythonIcon, name: 'Python')
  ];
  static const String githubUserName = 'richkazz';
  static const String githubDataUrl =
      'https://api.github.com/users/$githubUserName/repos';
  static List<Project> projectsList = [
    Project(
        id: '0',
        type: ['Api'],
        title: 'Flutter plus .NET Minimal Api',
        githubLink:
            'https://github.com/richkazz/api-flutter-with-asp.net-core-minimal-api',
        //websiteLink: 'https://hostel-app-test.herokuapp.com/login',
        description: 'Using Flutter plus Asp.net core minimal api',
        tools: ['C#', 'Javascript', '.NET Core', 'SSMS', 'Dart']),
    Project(
        id: '1',
        type: ['Learning'],
        title: 'Master-Coding',
        githubLink: 'https://github.com/richkazz/Master-Coding',
        //websiteLink: 'https://hostel-app-test.herokuapp.com/login',
        description: 'Data structure and algorithm practice',
        tools: [
          'C#',
          '.NET Core',
        ]),
    Project(
        id: '2',
        type: ['Website'],
        title: 'FoodPlanner',
        githubLink: 'https://github.com/richkazz/FoodPlanner',
        //websiteLink: 'https://hostel-app-test.herokuapp.com/login',
        description: 'A website to plan your food',
        tools: ['C#', '.NET Core', 'Javascript', 'Html', 'CSS']),
    Project(
        id: '3',
        type: ['Website', 'Application'],
        //websiteLink: 'https://shashiben.github.io',
        description:
            'Created portfolio using flutter,Supports for mac os,windows,linux,web,ios,android',
        githubLink: 'https://github.com/richkazz/my-portfolio',
        title: 'Portfolio',
        tools: ['Flutter']),
  ];
  static const List<String> skillsList = [
    'Flutter',
    '.NET',
    '.NET Core',
    'Git',
    'Firebase',
    'C# Developer',
    'Javascript',
    'C',
    'Python',
    'Dart',
    'Problem Solving',
  ];

  static const List<ExperienceTimeline> experienceList = [
    ExperienceTimeline(
      title: 'Programming Made Easy',
      position: 'Owner',
      timePeriod: 'Jan 2019 - date',
      description: [
        'Pioneered a thriving community dedicated to demystifying programming.',
        'Collaborated harmoniously with a diverse group of fellow developers, fostering an environment of shared learning and growth.',
        'Passionately taught the intricacies of Data Structures and Algorithms to eager learners.',
        'Played a pivotal role in the conception and execution of captivating community projects.',
      ],
      tools: [
        'Community Management',
        'Slack',
      ],
    ),
    ExperienceTimeline(
      title: 'TopRecur',
      position: 'Internship',
      timePeriod: 'Jan 2021 - ..',
      description: [
        'Embarked on an exhilarating internship journey, contributing significantly to mobile app development and front-end wizardry.',
        'Contributed to the creation of an innovative note-taking application reminiscent of Workflowy.',
        'Leveraged APIs to infuse dynamic content into the app, making it a living, breathing entity.',
        'Spruced up the app with the ability to dynamically customize text styles, adding a personal touch for users.',
      ],
      tools: [
        'Flutter',
        'HTML',
        'CSS',
        'JavaScript',
        '.NET',
      ],
    ),
    ExperienceTimeline(
      title: 'InspireCoders',
      position: 'Mobile App Developer',
      timePeriod: 'Aug 2022 - date',
      description: [
        'Teamed up with a visionary designer, transforming concepts into captivating mobile apps.',
        'Crafted visually stunning UI elements for an application akin to the popular Piggyvest.',
        'Brought user profiles to life with an intuitive frontend design.',
        'Enhanced user interaction with real-time chat functionality powered by WebSocket.',
        'Implemented timely notifications through the enchantment of Firebase Cloud Messaging.',
      ],
      tools: [
        'Flutter',
        'Figma',
        '.NET',
      ],
    ),
  ];
  static const String email = 'edawarekaro@gmail.com';
  static List<SkillModel> featuredSkills = [
    SkillModel(name: 'Mobile Application Development', percent: 95),
    SkillModel(name: 'Web Developer', percent: 90),
    SkillModel(name: 'UI/UX Designer', percent: 50),
    SkillModel(name: 'Backend Developer', percent: 89),
    SkillModel(name: '.NET Developer', percent: 90),
  ];

  static const String userName = 'Oghenekaro Edaware';
  static const String shortIntro =
      'I’m Oghenekaro Edaware and I’m a full stack developer, and I specialize in building efficient Flutter Applications that just work across all platforms and browsers. I care deeply about building interfaces that are usable and pleasant for the most number of people possible.And my main motto is whenever building any application is to always build pixel perfect high performant applications that provide user with a rich experience.';
  static const String intro =
      "I embarked on my journey in the world of development as a web developer, specializing in .NET applications. As I honed my skills, I became intrigued by Flutter, a versatile framework for crafting cross-platform applications. My foray into Flutter broadened my horizons and equipped me with the ability to create apps that run seamlessly on various platforms. Seeking opportunities for growth and development, I decided to pursue internships, where I not only refined my coding abilities but also honed my communication skills and deepened my understanding of code architectures. These experiences were invaluable in shaping me into a well-rounded developer. Subsequently, I ventured into the realm of freelancing, where I had the chance to apply my expertise to real-world projects. This phase of my career provided me with firsthand insights into building production-level applications, handling clients' needs, and maintaining the quality and robustness of my work. At present, I am channeling my focus back into web development, leveraging the knowledge and skills I've gained throughout my journey to create innovative and high-quality web applications. My career path has been marked by continuous learning and growth, and I am excited about the possibilities that lie ahead in the ever-evolving field of development.";
}
