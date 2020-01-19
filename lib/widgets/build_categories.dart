import 'package:flutter/material.dart';

class BuildCategories extends StatelessWidget {
  final List<String> categories;

  const BuildCategories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          String currentCategory = categories.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  currentCategory,
                  style: TextStyle(
                    fontSize: index == 0 ? 20 : 18,
                    fontWeight: index == 0 ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1500 noti',
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
