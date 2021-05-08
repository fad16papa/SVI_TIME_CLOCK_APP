import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerCustom extends StatelessWidget {
  final String textDivider;

  DividerCustom(this.textDivider);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
        Text(
          textDivider,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Theme.of(context).primaryColor),
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
      ]),
    );
  }
}
