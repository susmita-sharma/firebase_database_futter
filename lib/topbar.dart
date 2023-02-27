import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Icon(Icons.person),
        Text('Nepal Telecom Application Application'),
        Icon(Icons.arrow_drop_down),
      ],

    );
  }
}
//suwan has commited a file second time 20:27