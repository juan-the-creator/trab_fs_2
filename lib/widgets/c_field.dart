import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CField extends StatefulWidget {
  final TextEditingController textController;

  const CField({Key? key, required this.textController}) : super(key: key);
  @override
  _CField createState() {
    return _CField();
  }
}

class _CField extends State<CField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 124,
      height: 96,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: widget.textController,
              textCapitalization: TextCapitalization.characters,
              textAlign: TextAlign.center,
              maxLength: 4,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.75),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.75)),
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.75)),
                  counterText: ""),
              style: TextStyle(
                color: Color(0xFF333333),
                fontFamily: "Source Sans Pro",
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
