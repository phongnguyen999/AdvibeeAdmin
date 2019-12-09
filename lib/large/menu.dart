import 'dart:html';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:advicebee_page/pages/main_page.dart';
import '../data/menu.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as fb;
import '../styles.dart';


class MenuLarge extends StatefulWidget {
  @override
  _MenuLargeState createState() => _MenuLargeState();
}

class _MenuLargeState extends State<MenuLarge> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool isAuth = false;

  final Auth _firebaseAuth = fb.auth();
  @override
  void initState() {
    super.initState();
    _firebaseAuth.onAuthStateChanged.listen((user) {
      if (user != null) {
        print(user);
        setState(() {
          isAuth = true;
        });
      } else {
        isAuth = false;
      }
    }, onError: (err) {
      print('Error signing in');
    });


  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimen.menuHeight,
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 22),
            child: Text(
              "AdviceBee",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          for (var item in MenuItem.all()) _menuItem(item, context)
        ],
      ),
    );
  }

  Widget _menuItem(MenuItem menuItem, BuildContext context) {
    if (menuItem.isSpecialItem) {
      return _specialMenuItem(menuItem, context);
    } else {
      return _normalMenuItem(menuItem);
    }
  }

  Widget _specialMenuItem(MenuItem menuItem, BuildContext context) => isAuth
      ? OutlineButton(
          padding: EdgeInsets.symmetric(horizontal: Dimen.spacingLarge),
          child: Text(
            "Dashboard",
            style: Style.button,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
          },
          borderSide: BorderSide(color: NGColors.white, width: 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
      : OutlineButton(
          padding: EdgeInsets.symmetric(horizontal: Dimen.spacingLarge),
          child: Text(
            menuItem.name,
            style: Style.button,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Email'),
                              key: Key('email'),
                              onSaved: (val) => _email = val,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              key: Key('password'),
                              obscureText: true,
                              autocorrect: false,
                              onSaved: (val) => _password = val,
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: NGColors.accent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: Text(
                                "Submit",
                                style: Style.button,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  try {
                                    await _firebaseAuth
                                        .signInWithEmailAndPassword(
                                            _email, _password);
                                    //await Provider.of<FireAuthService>(context).createUser('nguyen','Phong','phong@phong.com', '12345678');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainPage(),
                                        ));
                                  } catch (e) {
                                    print(e.toString());
                                    Flushbar(
                                      title: "Sign in Error",
                                      message: e.toString(),
                                      duration: Duration(seconds: 5),
                                      backgroundColor: Colors.teal,
                                    )..show(context);
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          borderSide: BorderSide(color: NGColors.white, width: 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)));

  Widget _normalMenuItem(MenuItem menuItem) => Text(
        menuItem.name,
        style: Style.normal,
      );
}
