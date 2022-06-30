import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/models/Product.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/view_models/search_products_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

main() {
  SearchProductProvider provider = SearchProductProvider();
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => provider,
    ),
  ];

  runApp(MultiProvider(
    providers: providers,
    child: MaterialApp(
      home: Scaffold(
        body: Center(
          child: SearchBarWidgetMobile(
            searchProvider: provider,
          ),
        ),
      ),
    ),
  ));
}

class SearchBarWidgetMobile extends StatefulWidget {
  final SearchProductProvider searchProvider;
  const SearchBarWidgetMobile({Key? key, required this.searchProvider})
      : super(key: key);

  @override
  State<SearchBarWidgetMobile> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidgetMobile> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // widget.searchProvider.list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = widget.searchProvider.products;
    return Consumer<SearchProductProvider>(
      builder: (context, provider, _) => Column(
        children: [
          TextField(
            onTap: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(widget.searchProvider));
            },
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(widget.searchProvider));
                  },
                  child: const Icon(Icons.search)),
              hintText: 'Search for product',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchProduct(String query) {
    setState(() {
      widget.searchProvider.search(query);
    });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final SearchProductProvider searchProvider;
  CustomSearchDelegate(this.searchProvider);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: searchProvider.search(query),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: searchProvider.products.length,
              itemBuilder: (context, index) {
                Product product = searchProvider.products[index];
                return ListTile(
                  title: Text(product.name),
                  onTap: () => Navigator.pushNamed(
                      context, "${AppRoutes.productDetail}/${product.id}"),
                );
              });
        });
    return ListView.builder(
        itemCount: searchProvider.products.length,
        itemBuilder: (context, index) {
          final product = searchProvider.products[index];
          return ListTile(
            title: Text(product.name),
            onTap: () {
              Navigator.pushNamed(
                  context, "${AppRoutes.productDetail}/${product.id}");
              showResults(context);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
    // List<String> sugestions = ["Woman", "Men", "Children"];
    // return ListView.builder(
    //     itemCount: sugestions.length,
    //     itemBuilder: (context, index) {
    //       final sugestion = sugestions[index];
    //       return ListTile(
    //         title: Text(sugestion),
    //         onTap: () {
    //           query = sugestion;
    //           showResults(context);
    //         },
    //       );
    //     });
  }
}
