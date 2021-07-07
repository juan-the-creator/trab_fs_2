import 'package:flutter/material.dart';

class COverlay extends StatefulWidget {
  final String message;
  final String syllables;
  final Color color;
  const COverlay(
      {Key? key,
      this.message = "PARABÉNS",
      this.syllables = "Você acertou!!!",
      this.color = const Color(0xFF2E7D32)})
      : super(key: key);
  @override
  _COverlay createState() {
    return _COverlay();
  }
}

class _COverlay extends State<COverlay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .85,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(widget.message,
                                style: TextStyle(
                                  color: widget.color,
                                  letterSpacing: 3.5,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Karla",
                                  fontSize: 32,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.syllables,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: "Source Sans Pro",
                                fontSize: 28,
                              ),
                            )
                          ]))),
                ),
              ),
            )));
  }
}
