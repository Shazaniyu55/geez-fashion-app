import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geez/UI/pages/home/addpost.dart';
import 'package:geez/UI/pages/home/feed.dart';
import 'package:geez/UI/pages/home/notificationScreen.dart';
import 'package:geez/UI/pages/home/profile.dart';
import 'package:geez/UI/pages/home/search.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const NotificationScreen(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
