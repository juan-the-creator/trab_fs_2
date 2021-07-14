import 'package:flutter/material.dart';

class CButtonExit extends StatelessWidget {
  final String btnText;
  const CButtonExit({Key? key, this.btnText = "BOTÃO"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64.0,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.75),
                    right: BorderSide(color: Colors.black, width: 1.75),
                    top: BorderSide(color: Colors.black, width: 1.75),
                    left: BorderSide(color: Colors.black, width: 1.75)),
                color: Color(0xFFe96262)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    btnText,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: "Karla",
                        fontSize: 21),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
