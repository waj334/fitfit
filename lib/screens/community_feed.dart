import 'package:flutter/material.dart';

class CommunityFeed extends StatefulWidget {
  const CommunityFeed({super.key});

  @override
  State createState() => _CommunityFeedState();
}

class _CommunityFeedState extends State<CommunityFeed> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Community Feed"),
    );
  }
}