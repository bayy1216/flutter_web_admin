import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';

class StatisticsScreen extends StatelessWidget {
  static const routeName = 'statistics';

  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(

        child: Center(child: Text('statistics')),
      ),
    );
  }
}
