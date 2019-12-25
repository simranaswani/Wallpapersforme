
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallpaper_app/settings.dart';
import 'package:wallpaper_app/swipeView.dart';
import 'package:wallpaper_app/widgets/listview.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(70.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 52.0),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(52.0),
                topRight: Radius.circular(52.0)),
            child: BottomAppBar(
// shape: CircularNotchedRectangle(),

                notchMargin: 6.0,
                elevation: 50.0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50.0,
                              color: Colors.transparent,
                              width:
                                  MediaQuery.of(context).size.width / 2 - 40.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>ListWidget(),
                                          ),
                                        );
                                      
                                      },
                                      child: Icon(Entypo.home,
                                          color: Color(0xFFFF8C3B))),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SettingsView(),
                                          ),
                                        );
                                   
                                      },
                                      child: Icon(Entypo.game_controller,
                                          color: Color(0xFFFF8C3B)))
                                ],
                              )),
                          Container(
                              height: 50.0,
                              width:
                                  MediaQuery.of(context).size.width / 2 - 40.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                           SwipeView(),
                                          ),
                                        );
                                   
                                      },
                                      child: Icon(Entypo.document_landscape,
                                          color: Color(0xFFFF8C3B))),
                                  GestureDetector(
                                      onTap: () {
                                       
                                       
                                      },
                                      child: Icon(Entypo.wallet,
                                          color: Color(0xFFFF8C3B)))
                                ],
                              )),
                        ]))),
          ),
        ),
      ],
    );
  }
}
