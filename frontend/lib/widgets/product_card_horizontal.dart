import 'package:flutter/material.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String title;
  final String price;
  final String mainImage;
  final String rating;
  final Function() action;

  const ProductCardHorizontal(
      {Key? key,
      required this.title,
      required this.price,
      required this.mainImage,
      required this.rating,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => {print("tap product")},
        child: Container(
          height: 120,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(color: Colors.black),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(rating),
                      Text("\$$price"),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$$price"),
                              ElevatedButton(
                                  onPressed: () => action,
                                  child: Text("Add Cart"))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
