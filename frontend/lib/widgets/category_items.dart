import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Men", "Women", "Kids", "Accessories"];
    return Container(
      height: 25,
      margin: EdgeInsets.all(16),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            if (category == "Women") {
              return Container(
                margin: EdgeInsets.only(right: 8),
                child: Chip(
                  backgroundColor: Colors.amber,
                  elevation: 1,
                  label: Text(category),
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(category),
              ),
            );
          }),
    );
  }
}
