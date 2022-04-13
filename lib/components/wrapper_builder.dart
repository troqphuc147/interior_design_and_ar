import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/core/service/database.dart';
import 'package:provider/provider.dart';

class WrapperBuilder extends StatelessWidget {
  final Widget Function(BuildContext, AsyncSnapshot<User?>) builder;
  const WrapperBuilder({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.userStream,
        builder: (context, snapshot) {
          final user = snapshot.data;

          if (user != null) {
            return MultiProvider(providers: [
              Provider<DatabaseService>(
                create: (BuildContext context) {
                  return DatabaseService(uid: user.uid);
                },
              ),
            ], child: builder(context, snapshot));
          } else {
            return builder(context, snapshot);
          }
        });
  }
}
