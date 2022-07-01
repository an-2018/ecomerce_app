import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/models/Product.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/view_models/search_products_provider.dart';
import 'package:nusabomapp/views/home/components/product_list.dart';
import 'package:nusabomapp/views/home/home.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/category_items.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:nusabomapp/widgets/product_card.dart';
import 'package:nusabomapp/widgets/search_bar_widget.dart';
import 'package:nusabomapp/widgets/search_bar_widget_mobile.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  final HomeController controller;

  const HomeMobile(this.controller, {Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  List<int> data = [];
  int currentLength = 0;
  late ProductProvider productProvider;
  late SearchProductProvider searchProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    searchProvider = Provider.of<SearchProductProvider>(context, listen: false);
    productProvider.list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppaBar(),
      bottomNavigationBar: const BottonNavigationWidget(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                // buildSearchBar(),
                Consumer<ProductProvider>(
                  builder: (context, provider, _) {
                    if (productProvider.loading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (productProvider.hasError) {
                      return Center(child: CustomErrorWidget());
                    }

                    return Expanded(
                      child: LazyLoadScrollView(
                          isLoading: provider.loading,
                          onEndOfPage: () => provider.list(),
                          scrollDirection: Axis.vertical,
                          child: Stack(
                            children: [
                              Container(
                                height: 100,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: buildSearchBar(),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 100),
                                child: Column(
                                  children: [
                                    CategoryItems(),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: ProductListWidget(
                                          productProvider: productProvider,
                                          homeController: widget.controller,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildAppaBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Center(
          child: Text(
        "Discover",
        style: AppText.heading5(context),
      )),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  buildSearchBar() {
    TextEditingController textController = TextEditingController();
    textController.value = TextEditingValue(text: "Search product");

    return SearchBarWidgetMobile(searchProvider: searchProvider);
  }
}
