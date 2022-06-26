import 'package:flutter/material.dart';

class AdaptiveLayout extends StatefulWidget {
  final Widget? wideLayout;
  final Widget? narrowLayout;

  const AdaptiveLayout({Key? key, this.wideLayout, this.narrowLayout})
      : super(key: key);

  @override
  State<AdaptiveLayout> createState() => _AdaptiveLayoutState();
}

class _AdaptiveLayoutState extends State<AdaptiveLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          if (constraints.maxWidth >= 900) {
            return widget.wideLayout != null
                ? widget.wideLayout as Widget
                : Container();
          } else {
            return widget.narrowLayout != null
                ? widget.narrowLayout as Widget
                : const Center(
                    child: Text("Screen Layout commint on next release"),
                  );
          }
        },
      ),
    );
  }
}
