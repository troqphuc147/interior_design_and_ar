import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/service/auth.dart';
import 'package:interior_design_and_ar/service/database.dart';
import 'package:provider/provider.dart';

class WrapperBuilder extends StatelessWidget {
  final Widget Function(BuildContext, AsyncSnapshot<User>) builder;
  WrapperBuilder({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);

    // streambuilder để theo dõi trạng thái của user
    return StreamBuilder<User?>(
        stream: auth.streamUser(),
        builder: (context, snapshot) {
          final user = snapshot.data;

          // trả về MultiProvider
          if (user != null) {
            return MultiProvider(providers: [
              // dịch vụ firestore
              Provider<DatabaseService>(
                create: (BuildContext context) {
                  return DatabaseService(uid: user.uid);
                },
              ),
            ], child: builder(context, snapshot as AsyncSnapshot<User>));
          } else {
            return builder(context, snapshot as AsyncSnapshot<User>);
          }
        });
  }
}
