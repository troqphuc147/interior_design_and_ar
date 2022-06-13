import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/screens/profile/components/chat_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/user_chat.dart';
import 'package:interior_design_and_ar/size_config.dart';

class ChatHomeScreen extends StatefulWidget {
  //final UserChat currentUserChat;
  //HomeScreen({Key key, @required this.currentUserChat}) : super(key: key);
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  bool isLoading = false;
  // bool isLoggedIn = false;
  int _limit = 20;
  final int _limitIncrement = 20;
  final ScrollController listScrollController = ScrollController();

  //_HomeScreenState({Key key, @required this.currentUserChat});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listScrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (listScrollController.offset >= listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'CHAT',
          style: TextStyle(
            color: kTextColor1,
            fontWeight: FontWeight.w600,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        elevation: 8,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kTextColor1,
            size: getProportionateScreenWidth(24),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(child: isLoading
              ?CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),)
              :Container()),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages').limit(_limit).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => buildItem(context, snapshot.data!.docs[index]),
                    itemCount: snapshot.data!.docs.length,
                    controller: listScrollController,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document != null) {
      UserChat userChat = UserChat.fromDocument(document);
      if (userChat.id == adminUserChat.id) {
        return SizedBox.shrink();
      } else {
        return Container(
          child: TextButton(
            child: Row(
              children: <Widget>[
                Material(
                  child: userChat.photoUrl.isNotEmpty
                      ? Image.network(
                    userChat.photoUrl,
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      return Icon(
                        Icons.account_circle,
                        size: 50.0,
                        color: Colors.grey[200],
                      );
                    },
                  )
                      : Icon(
                    Icons.account_circle,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  clipBehavior: Clip.hardEdge,
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            userChat.name,
                            maxLines: 1,
                            style: TextStyle(color: Colors.black87),
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                        ),
                        Container(
                          child: Text(
                            userChat.email,
                            maxLines: 1,
                            style: TextStyle(color: Colors.black87),
                          ),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 20.0),
                  ),
                ),
              ],
            ),
            onPressed: () {
              print('$userChat');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(currentUserChat: userChat, isUserNormalCustomer: false,),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>((Colors.grey[200])!),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }
}