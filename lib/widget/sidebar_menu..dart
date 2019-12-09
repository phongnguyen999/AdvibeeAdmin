import 'package:advicebee_page/commons/theme.dart';
import 'package:advicebee_page/model/menu.dart';
import 'package:advicebee_page/widget/menu_item_tile.dart';
import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {

  int selectedIndex;
  SideBarMenu(this.selectedIndex);
  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidgth = 70;
  bool collapsed = false;
  int selectedIndex = 0;

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation = Tween<double>(begin: maxWidth, end: minWidgth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black26, spreadRadius: 2)
            ],
            color: drawerBgColor,
          ),
          width: _animation.value,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://backgrounddownload.com/wp-content/uploads/2018/09/google-material-design-background-6.jpg"),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://www.getdirectadvice.com/images/logo.png"),
                            backgroundColor: Colors.white,
                            radius: _animation.value >= 250 ? 30 : 20,
                          ),
                          SizedBox(
                            width: _animation.value >= 250 ? 20 : 0,
                          ),
                          (_animation.value >= 250)
                              ? Text("AdviceBee",
                                  style: menuListTileDefaultText)
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: _animation.value >= 250 ? 20 : 0,
                      ),
                      Spacer(),
                      (_animation.value >= 250)
                          ? Text(
                              "AdviceBee Admin",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Container(),
                      (_animation.value >= 250)
                          ? Text(
                              "wsuadvicebee@gmail.com",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemTile(
                      title: menuItems[index].title,
                      icon: menuItems[index].icon,
                      animationController: _animationController,
                      isSelected: widget.selectedIndex == index,
                      onTap: () {
                        Navigator.push(context, menuItems[index].route);
                      },
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    collapsed = !collapsed;
                    collapsed
                        ? _animationController.reverse()
                        : _animationController.forward();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
