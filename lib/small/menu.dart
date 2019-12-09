import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:advicebee_page/pages/main_page.dart';

import '../styles.dart';
import '../data/menu.dart';

class MenuSmall extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Auth _firebaseAuth = fb.auth();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimen.spacingSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          for (var item in MenuItem.all())
            _menuItem(item, context)
        ],
      ),
    );
  }

  Widget _menuItem(MenuItem menuItem, BuildContext context) {
    if (menuItem.isSpecialItem){
      return _specialMenuItem(menuItem, context);
    } else {
      return _normalMenuItem(menuItem);
    }
  }

  Widget _specialMenuItem(MenuItem menuItem, BuildContext context) => OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: Dimen.spacingNormal),
      child: Text(
        menuItem.name,
        style: Style.normalBlack,
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
                              onSaved: (val)=> _email =val,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              key: Key('password'),
                              obscureText: true,
                              autocorrect: false,
                              onSaved: (val) => _password = val,
                              decoration: InputDecoration(labelText: 'Password'),
                            ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: NGColors.accent,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                              child: Text("Submit",               
                              style: Style.button,),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  print(_password);
                                  print(_email);
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
                          )
                        ],
                      ),
                    ),
                  );
                });
      },
      borderSide: BorderSide(color: NGColors.black, width: 3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)));

  Widget _normalMenuItem(MenuItem menuItem) =>
      Text(menuItem.name, style: Style.normalBlack,);
}
