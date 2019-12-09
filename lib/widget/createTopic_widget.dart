import 'package:firebase/firestore.dart';
import 'package:advicebee_page/commons/theme.dart';
import 'package:advicebee_page/model/comment_model.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

final CollectionReference topicRef = fb.firestore().collection('topics');

class CreateTopicWidget extends StatefulWidget {
  CreateTopicWidget({
    Key key,
    @required Size media,
  })  : _media = media,
        super(key: key);

  final Size _media;
  String _topicName = "Sample Topic";
  String _topicDescription = "An interesting description";
  String _topicURL = "http://www.getdirectadvice.com/images/logo.png";

  @override
  _CreateTopicWidgetState createState() => _CreateTopicWidgetState();
}

class _CreateTopicWidgetState extends State<CreateTopicWidget> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _topicName;
    String _topicURL;
    String _topicDescription;

    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: widget._media.height / 1.9,
        width: widget._media.width / 3 + 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Add Topic",
                  style: cardTitleTextStyle,
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 8.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  child: TextFormField(
                    key: Key('topicname'),
                    onSaved: (val) => _topicName = val,
                    decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.person, color: Color(0xff224597)),
                        ),
                        hintText: 'Topic Name',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0))),
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 8.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  child: TextFormField(
                    key: Key('topicdescription'),
                    onSaved: (val) => _topicDescription = val,
                    decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.email, color: Color(0xff224597)),
                        ),
                        hintText: 'Topic Description',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0))),
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 8.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  child: TextFormField(
                    key: Key('topicurl'),
                    onSaved: (val) => _topicURL = val,
                    decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.lock, color: Color(0xff224597)),
                        ),
                        hintText: 'Logo URL',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0))),
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 8.0,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                  child: ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget._topicURL),
                      //radius: 30,
                    ),
                    title: Text(
                      widget._topicName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget._topicDescription,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    isThreeLine: true,
                    trailing: Material(
                      color: commentList[0].color,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 20,
                        child: Text(
                          commentList[0].status.index == 0
                              ? "Pending"
                              : commentList[0].status.index == 1
                                  ? "Approved"
                                  : "Rejected",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        onTap: () async{
                          _formKey.currentState.save();
                      
                          setState(() {
                            widget._topicName = _topicName;
                            widget._topicDescription = _topicDescription;
                            widget._topicURL = _topicURL;
                          });
                        },
                        child: Material(
                          shadowColor: Colors.grey,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: Colors.greenAccent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 80,
                            child: Text(
                              "Preview",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () async {
                          print("Clicked");
                          var newData = {
                            'dateCreated': DateTime.now(),
                            'pictureURL': widget._topicURL,
                            'topicName': widget._topicName,
                          };

                          await topicRef
                              .doc(widget._topicName)
                              .set(newData, SetOptions(merge: true));
                          Flushbar(
                                  
                                      message: "New Topic Uploaded Successfully",
                                      duration: Duration(seconds: 5),
                                      backgroundColor: Colors.teal,
                                    )..show(context);
                        },
                        child: Material(
                          shadowColor: Colors.grey,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: Colors.greenAccent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 80,
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
