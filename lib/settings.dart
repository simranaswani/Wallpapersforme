
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:io';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsViewState();
  }
}

class SettingsViewState extends State<SettingsView> {
  bool isDarkThemeMode = false;
  var platformSystemVersion = Platform.operatingSystemVersion.toString();
  var platformVersion = Platform.version.toString();

  @override
  void initState() {
    super.initState();
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
              children: [
                               Padding(
              padding: EdgeInsets.only(top: 30, right: 320, bottom: 550),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
                Padding(
          padding: EdgeInsets.only(left: 20, top: 80, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    UtilsImporter().stringUtils.settings,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Netflix",
                        color: Color(0xFFFF8C3B),
                        fontSize: 35),
                  ),
                  InkWell(
                    onTap: () {
                      if (isDarkThemeMode == true) {
                        setState(() {
                          isDarkThemeMode = false;
                        });

                        _changeTheme(context, MyThemeKeys.LIGHT);
                      } else {
                        setState(() {
                          isDarkThemeMode = true;
                        });

                        _changeTheme(context, MyThemeKeys.DARK);
                      }
                    },
                    child: Image.asset(
                        isDarkThemeMode == false
                            ? 'assets/sun.png'
                            : 'assets/moon.png',
                        width: 30,
                        height: 30),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                UtilsImporter().stringUtils.settingsDescription,
                style: TextStyle(
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Netflix",
                    fontSize: 0),
              ),
              Expanded(
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: settingsAry == null ? 0 : settingsAry.length,
                  itemBuilder: (BuildContext context, int index) {
                    IconData icon;

                    if (index == 0) {
                      icon = Entypo.help;
                    } else if (index == 1) {
                      icon = Entypo.phone;
                    } else if (index == 2) {
                      icon = Entypo.star;
                    } else if (index == 3) {
                      icon = Entypo.share;
                    } else if (index == 4) {
                      icon = Entypo.info;
                    } else if (index == 5) {
                      icon = Entypo.log_out;
                    }
                    return new GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => {_onTileClicked(index)},
                      child: SettingsCard(
                        title: settingsAry[index]['title'],
                        description: settingsAry[index]['description'],
                        index: index,
                        iconData: icon,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
              ],),
              
    );
  }

  _launchFAQ() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // sendEmail() async {
  //   if (Platform.isIOS) {
  //     final Email email = Email(
  //       body:
  //           '\n$platformVersion\n$platformSystemVersion\nPlease begin your message from here: ',
  //       subject: 'Feedback from app',
  //       recipients: ['moneylottoapp@gmail.com'],
  //       isHTML: false,
  //     );
  //     await FlutterEmailSender.send(email);
  //   } else if (Platform.isAndroid) {
  //     final Email email = Email(
  //       body:
  //           '\n$platformVersion\n$platformSystemVersion\nPlease begin your message from here: ',
  //       subject: 'Feedback from app',
  //       recipients: ['dhanadhanapp@gmail.com'],
  //       isHTML: false,
  //     );
  //     await FlutterEmailSender.send(email);
  //   }
  // }

  Future<Null> handleSignOut() async {
    // await FirebaseAuth.instance.signOut();

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //     (Route<dynamic> route) => false);
  }

  void _onTileClicked(int index) {
    if (index == 0) {
      _launchFAQ();
    } else if (index == 1) {
      //sendEmail();
    } else if (index == 2) {
    } else if (index == 3) {
      if (Platform.isIOS) {
        Share.share(
            'I made quick money using MoneyLotto on the App Store! Download now!',
            subject: 'Do you want to earn money fast?');
      } else if (Platform.isAndroid) {
        Share.share(
            'I made quick money using DhanaDhan on the Play Store! Download now!',
            subject: 'Do you want to earn money fast?');
      }
    } else if (index == 4) {
    } else if (index == 5) {
      handleSignOut();
    }
  }
}

class SettingsCard extends StatefulWidget {
  final String title;
  final String description;
  final int index;
  final IconData iconData;

  SettingsCard({this.title, this.description, this.index, this.iconData});

  @override
  State<StatefulWidget> createState() {
    return SettingsCardState();
  }
}

class SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(widget.iconData,
                      color: Color(0xFFFF8C3B).withOpacity(0.7))
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Netflix",
                                  color: Color(0xFFFF8C3B),
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.description,
                              style: TextStyle(
                                  color: UtilsImporter().colorUtils.orangeColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Netflix",
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Entypo.chevron_right,
                              color: Color(0xFFFF8C3B).withOpacity(0.7))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(height: 4),
            Divider()
          ],
        ),
      ),
    );
  }
}

enum MyThemeKeys { LIGHT, DARK, DARKER }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: UtilsImporter().colorUtils.primaryColor))),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: UtilsImporter().colorUtils.primaryColor))),
  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      case MyThemeKeys.DARKER:
        return darkerTheme;
      default:
        return lightTheme;
    }
  }
}

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  _CustomTheme({
    this.data,
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final MyThemeKeys initialThemeKey;

  const CustomTheme({
    Key key,
    this.initialThemeKey,
    @required this.child,
  }) : super(key: key);

  @override
  CustomThemeState createState() => new CustomThemeState();

  static ThemeData of(BuildContext context) {
    _CustomTheme inherited =
        (context.dependOnInheritedWidgetOfExactType() as _CustomTheme);
    return inherited.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    _CustomTheme inherited =
        (context.dependOnInheritedWidgetOfExactType() as _CustomTheme);
    return inherited.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.getThemeFromKey(widget.initialThemeKey);
    super.initState();
  }

  void changeTheme(MyThemeKeys themeKey) {
    setState(() {
      _theme = MyThemes.getThemeFromKey(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _CustomTheme(
      data: this,
      child: widget.child,
    );
  }
}

class StringUtils {
  String settings = 'Account Settings';
  String settingsDescription = '';
}

var settingsAry = [
  {"title": "FAQ's", "description": "Read our FAQ's to learn more"},
  {
    "title": "Contact us",
    "description":
        "Didn't find your answers in the FAQ's? Our team is here to help you"
  },
  {
    "title": "Rate our app",
    "description": "Tell us about your experience & give us your feedback"
  },
  {
    "title": "Refer to friend",
    "description":
        "Tell your friends & family about our app & earn 200 coins now!"
  },
  {"title": "About us", "description": "Learn more about our app"},
  {
    "title": "Sign out",
    "description": "Leaving so soon? Click here to Sign out"
  },
];

class ColorUtils {
  Color primaryColor = HexColor("ffffff");
  Color orangeColor = HexColor("000000");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class UtilsImporter {
  ColorUtils colorUtils = new ColorUtils();
  StringUtils stringUtils = new StringUtils();
}