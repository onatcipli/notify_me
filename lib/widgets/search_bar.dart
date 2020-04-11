import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String text) onChanged;
  final bool backButton;

  const SearchBar({Key key, @required this.onChanged, this.backButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (backButton)
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey[300], fontStyle: FontStyle.italic),
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
