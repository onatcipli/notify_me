import 'package:flutter/material.dart';

class NotifyDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            BuildCategories(
              categories: ['favorilerim', 'yemek'],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCategories extends StatelessWidget {
  final List<String> categories;

  const BuildCategories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Card(
            borderOnForeground: true,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(hintText: 'search '),
            ),
          ),
        ),
      ],
    );
  }
}
