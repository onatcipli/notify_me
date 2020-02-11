import 'package:flutter/material.dart';

class BuildCategories extends StatefulWidget {
  final List<String> categories;

  BuildCategories({this.categories});

  @override
  _BuildCategoriesState createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100,
      child: ListView.builder(
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final String currentCategory = widget.categories.elementAt(index);
          GlobalKey key = GlobalKey();
          return GestureDetector(
            key: key,
            onTap: () {
              setState(() {
                this.selectedIndex = index;
              });
              Scrollable.ensureVisible(key.currentContext,curve: Curves.easeIn, duration: Duration(milliseconds: 200));
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    currentCategory,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.black.withOpacity( index == selectedIndex ? .9 : .5),
                      fontWeight: index == selectedIndex
                          ? FontWeight.w600
                          : FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('1500 noti',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black.withOpacity( index == selectedIndex ? .5 : .3),
                        fontWeight: index == selectedIndex
                            ? FontWeight.w300
                            : FontWeight.w300,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
