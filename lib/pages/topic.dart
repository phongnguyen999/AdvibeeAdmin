import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:advicebee_page/commons/theme.dart';
import 'package:advicebee_page/widget/card_tile.dart';
import 'package:advicebee_page/widget/chart_card_tile.dart';
import 'package:advicebee_page/widget/comment_widget.dart';
import 'package:advicebee_page/widget/createTopic_widget.dart';
import 'package:advicebee_page/widget/profile_Widget.dart';
import 'package:advicebee_page/widget/project_widget.dart';
import 'package:advicebee_page/widget/quick_contact.dart';
import 'package:advicebee_page/widget/responsive_widget.dart';
import 'package:advicebee_page/widget/sidebar_menu..dart';

class Topic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveWidget.isLargeScreen(context)
                    ? SideBarMenu(2)
                    : Container(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 55,
                        width: _media.width,
                        child: AppBar(
                          elevation: 4,
                          centerTitle: true,
                          title: Text(
                            "AdviceBee Topic",
                          ),
                          backgroundColor: drawerBgColor,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 20),
                          children: <Widget>[
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            CardTile(
                                              iconBgColor: Colors.orange,
                                              cardTitle: "Active Topics",
                                              icon: Icons.insert_drive_file,
                                              subText: "Todays",
                                              mainText: "9",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.pinkAccent,
                                              cardTitle: "Website Visits",
                                              icon: Icons.show_chart,
                                              subText:
                                                  "Tracked from Google Analytics",
                                              mainText: "3.560",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor: Colors.green,
                                              cardTitle: "Revenue",
                                              icon: Icons.home,
                                              subText: "Last 24 Hours",
                                              mainText: "2500",
                                            ),
                                            SizedBox(width: 20),
                                            CardTile(
                                              iconBgColor:
                                                  Colors.lightBlueAccent,
                                              cardTitle: "Followors",
                                              icon: Icons.unfold_less,
                                              subText: "Last 24 Hours",
                                              mainText: "112",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ProjectWidget(media: _media),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CreateTopicWidget(media: _media,)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  //QuickContact(media: _media)
                                ],
                              ),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CommentWidget(media: _media),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ProfileWidget(media: _media),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        
      },
    );
  }
}
