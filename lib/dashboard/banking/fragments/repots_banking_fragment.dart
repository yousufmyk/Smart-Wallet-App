import 'package:flutter/material.dart';
import '../../../dashboard/banking/fragments/home_banking_fragment.dart';

class ReportsBankingFragment extends StatefulWidget {
  @override
  _ReportsBankingFragmentState createState() => _ReportsBankingFragmentState();
}

class _ReportsBankingFragmentState extends State<ReportsBankingFragment> {
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
