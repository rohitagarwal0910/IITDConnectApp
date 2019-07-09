import 'package:flutter/material.dart';

class AddUpdate extends StatefulWidget {
  final Function _onSubmit;

  AddUpdate(this._onSubmit);

  @override
  State<StatefulWidget> createState() {
    return _AddUpdateState();
  }
}

class _AddUpdateState extends State<AddUpdate> {
  Function _onSubmit;

  @override
  void initState() {
    _onSubmit = widget._onSubmit;
    super.initState();
  }

  TextEditingController _controller = TextEditingController();
  String _message;
  
  @override
  Widget build(BuildContext context) {
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
              controller: _controller,
              onChanged: (text) {
                _message = text;
              },
              onSubmitted: (text) {
                _controller.clear();
                _onSubmit(text);
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
          ),
          FlatButton(
            onPressed: () {
              _onSubmit(_message);
              _controller.clear();
              _message = '';
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.indigo[400],
          )
        ],
      ),
    );
  }
}
