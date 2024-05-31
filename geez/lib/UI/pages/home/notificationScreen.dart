// ignore_for_file: unused_local_variable, file_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geez/model/userModel.dart' as model;
import 'package:geez/provider/user.dart';
import 'package:geez/widget/notificationcard.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  final postId;
  const NotificationScreen({super.key, this.postId});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.postId)
            .collection('comments')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => NotificationCard(
              snap: snapshot.data!.docs[index],
            ),
          );
        },
      ),
    );
  }
}
