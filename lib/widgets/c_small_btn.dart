import 'package:flutter/material.dart';

void dbgClick() {
  print("Clicked");
}

class CSmallButton extends StatelessWidget {
  final String btnText;
  final VoidCallback callback;

  const CSmallButton(
      {Key? key, this.btnText = "BOTÃO", this.callback = dbgClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: SizedBox(
          height: 64.0,
          width: 96,
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.75),
                      right: BorderSide(color: Colors.black, width: 1.75),
                      top: BorderSide(color: Colors.black, width: 1.75),
                      left: BorderSide(color: Colors.black, width: 1.75)),
                  color: Color(0xFF96fcb1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btnText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: "Karla",
                        fontSize: 21),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
