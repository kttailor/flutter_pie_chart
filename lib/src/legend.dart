import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  Legend({
    @required this.title,
    @required this.color,
    @required this.style,
  });

  final String title;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            title,
            style: style,
            softWrap: true,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.0),
          height: 20.0,
          width: 18.0,
          color: color,
        ),
      ],
    );
  }
}
