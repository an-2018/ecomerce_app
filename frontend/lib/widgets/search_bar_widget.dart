import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          child: SearchBarWidget(
            searchProvider: provider,
          ),
        ),
      ),
    ),
  ));
}

class SearchBarWidget extends StatefulWidget {
  final SearchProductProvider searchProvider;
  const SearchBarWidget({Key? key, required this.searchProvider})
      : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for product',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey))),
              onChanged: searchProduct,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return ListTile(
                    title: Text(product.name),
                    leading: CachedNetworkImage(
                      imageUrl: product.gallery.first,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  );
                }),
          )
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
