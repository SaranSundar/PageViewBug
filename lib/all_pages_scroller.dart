import 'package:flutter/material.dart';
import 'package:page_view_bug/sign_in_page.dart';
import 'package:page_view_bug/sign_up_page.dart';

class AllPagesScroller extends StatefulWidget {
  const AllPagesScroller({Key? key}) : super(key: key);

  @override
  State<AllPagesScroller> createState() => _AllPagesScrollerState();
}

class _AllPagesScrollerState extends State<AllPagesScroller> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        SignInPage(),
        SignUpPage(),
      ],
    );
  }
}
