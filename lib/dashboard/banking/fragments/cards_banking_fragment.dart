import 'package:flutter/material.dart';
import '../../../dashboard/banking/fragments/home_banking_fragment.dart';

class CardsBankingFragment extends StatefulWidget {
  @override
  _CardsBankingFragmentState createState() => _CardsBankingFragmentState();
}

class _CardsBankingFragmentState extends State<CardsBankingFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBankingFragment(),
    );
  }
}
