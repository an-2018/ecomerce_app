import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? heading5 = Theme.of(context).textTheme.headline5;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            child: Icon(
              Icons.dangerous,
              size: 64,
              color: Colors.redAccent,
            ),
          ),
          Text(
            "Error Loading Data!",
            style: heading5,
          )
        ],
      ),
    );
  }
}
