import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String title;
  final String price;
  final String mainImage;
  final String description;
  final Function() action;

  const ProductCardHorizontal(
      {Key? key,
      required this.title,
      required this.price,
      required this.mainImage,
      required this.description,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => {print("To Be Implemented")},
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
                child: CachedNetworkImage(
                  imageUrl: mainImage,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Flexible(
                          child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$$price"),
                              ElevatedButton(
                                  onPressed: () => action,
                                  child: Text("Remove"))
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
