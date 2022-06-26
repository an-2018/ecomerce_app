import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:nusabomapp/constants/app_routes.dart';
import 'package:nusabomapp/constants/app_text.dart';
import 'package:nusabomapp/models/Product.dart';
import 'package:nusabomapp/view_models/products_provider.dart';
import 'package:nusabomapp/views/home/components/product_list.dart';
import 'package:nusabomapp/widgets/botton_navigation.dart';
import 'package:nusabomapp/widgets/category_items.dart';
import 'package:nusabomapp/widgets/custom_error_widget.dart';
import 'package:nusabomapp/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  List<int> data = [];
  int currentLength = 0;
  late ProductProvider productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? heading5 = Theme.of(context).textTheme.headline5;
    final TextStyle? heading6 = Theme.of(context).textTheme.headline6;
    final TextStyle? body = Theme.of(context).textTheme.bodyLarge;

    List<Product> productList = [
      Product(
        name: "Rosato men shirt",
        id: '1',
        description: 'Description',
        details: <String, String>{"adjective": "value"},
        discountValue: 10,
        category: 'category',
        price: 10,
        hasDiscount: false,
        gallery: [],
      ),
    ];

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
                      return CustomErrorWidget();
                    }

                    return Expanded(
                      child: LazyLoadScrollView(
                          isLoading: provider.loading,
                          onEndOfPage: () => provider.list(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              buildSearchBar(),
                              CategoryItems(),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: ProductListWidget(
                                      productProvider: productProvider),
                                ),
                              ),
                            ],
                          )

                          // child: GridView.builder(
                          //   clipBehavior: Clip.none,
                          //   shrinkWrap: true,
                          //   padding: EdgeInsets.all(16),
                          //   itemCount: productProvider.products.length,
                          //   itemBuilder: (context, index) {
                          //     Product product = productProvider.products[index];
                          //     return Center(
                          //       child: Container(
                          //           color: Colors.redAccent,
                          //           height: 300,
                          //           width: double.maxFinite,
                          //           child: Text("${product.name}")
                          //           // ProductCard(
                          //           //   action: () {},
                          //           //   title: product.name,
                          //           //   mainImage: '',
                          //           //   price: "${product.price}",
                          //           //   rating: '',
                          //           // ),
                          //           ),
                          //     );
                          //   },
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 2),
                          // ),

                          // child: ListView.builder(
                          //   itemCount: provider.products.length,
                          //
                          //   // mainAxisAlignment: MainAxisAlignment.start,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     Product product = productProvider.products[index];
                          //
                          //     return ProductCard(
                          //       action: () {},
                          //       title: product.name,
                          //       mainImage: '',
                          //       price: "${product.price}",
                          //       rating: '',
                          //     );
                          //   },

/*            children: [

                          Container(
                            padding: EdgeInsets.all(16),
                            child: TextField(
                              controller: textController,
                            ),
                          ),
                          CategoryItems(),
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text("Hero slide")),
                          ),
                          Container(
                            child: Text("New Trend"),
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                child: GridView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    Product product = productList[index];
                                    return ProductCard(
                                      action: () {},
                                      title: product.name,
                                      mainImage: '',
                                      price: "${product.price}",
                                      rating: '',
                                    );
                                  },
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                                ),
                              ),
                            ),
                          )
                        ],*/
                          // ),
                          ),
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

    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: textController,
      ),
    );
  }

  Widget buildProductList(ProductProvider productProvider) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: productProvider.products
          .map(
            (product) => ProductCard(
              action: () => Navigator.pushNamed(
                  context, "${AppRoutes.productDetail}/${product.id}"),
              title: product.name,
              mainImage: product.gallery[0],
              price: "${product.price}",
              rating: '',
            ),
          )
          .toList() as List<Widget>,
    );
  }
}
