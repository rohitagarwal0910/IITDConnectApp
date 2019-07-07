import 'package:flutter/material.dart';

class AddUpdate extends StatelessWidget {
  final Function _onSubmit;

  AddUpdate(this._onSubmit);

  @override
  Widget build(BuildContext context) {
    String _message;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  filled: true,
                  fillColor: Color(0x0AAAAAAA),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white30)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Add an update...',
                  hintStyle: TextStyle(color: Colors.white54)),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              onChanged: (text) {
                _message = text;
              },
            ),
          ),
          FlatButton(
            onPressed: () {
              _onSubmit(_message);
            },
            child: Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.indigo[300],
          )
        ],
      ),
    );
  }
}
