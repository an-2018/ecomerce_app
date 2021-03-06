import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

main() {
  final images = [
    "http://placeimg.com/640/480/sports",
    "http://placeimg.com/640/480/business",
    "http://placeimg.com/640/480/abstract",
    "http://placeimg.com/640/480/food"
  ];
  runApp(MaterialApp(
    home: Scaffold(body: Image.network("http://placeimg.com/640/480/sports")),
  ));
}

class ImageSlides extends StatefulWidget {
  List<String> images;
  bool? isMobile;
  ImageSlides({Key? key, required this.images, this.isMobile})
      : super(key: key);

  @override
  State<ImageSlides> createState() => _ImageSlidesState();
}

class _ImageSlidesState extends State<ImageSlides> {
  CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.isMobile ?? true) {
      return buildCaroselMobile(context);
    }

    return Container(
      width: 300,
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _controller,
                itemCount: widget.images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = widget.images[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  height: MediaQuery.of(context).size.height * 0.8,
                  autoPlay: true,
                  pageSnapping: false,
                  viewportFraction: 0.3,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  clipBehavior: Clip.hardEdge,
                  disableCenter: true,
                  onPageChanged: (index, reason) => setState(() {
                    _currentIndex = index;
                  }),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                child: Center(
                  child: buildButton(previousImage, Icons.arrow_back_ios,
                      Alignment.centerLeft, Alignment.centerRight),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: buildButton(nextImage, Icons.arrow_forward_ios,
                      Alignment.centerRight, Alignment.centerLeft),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          buildIndicators(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget buildCaroselMobile(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _controller,
                itemCount: widget.images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = widget.images[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  height: 300,
                  autoPlay: true,
                  pageSnapping: false,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  clipBehavior: Clip.hardEdge,
                  onPageChanged: (index, reason) => setState(() {
                    _currentIndex = index;
                  }),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                child: Center(
                  child: buildButton(previousImage, Icons.arrow_back_ios,
                      Alignment.centerLeft, Alignment.centerRight),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: buildButton(nextImage, Icons.arrow_forward_ios,
                      Alignment.centerRight, Alignment.centerLeft),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          buildIndicators(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 300,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          // color: index % 2 > 0 ? Colors.amber : Colors.blue,
          // image: DecorationImage(
          //   image: CachedNetworkImageProvider(
          //     imageUrl,
          //   ),
          //   fit: BoxFit.contain,
          // ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber),
      height: 300,
      child: imageUrl.isEmpty
          ? Center(
              child: Icon(
                Icons.image_search,
                size: 64,
                color: Colors.white,
              ),
            )
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              errorWidget: (context, param, _) => Center(
                child: Icon(
                  Icons.image_search,
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  Widget buildImageMobile(String imageUrl, int index) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          // color: index % 2 > 0 ? Colors.amber : Colors.blue,
          // image: DecorationImage(
          //   image: CachedNetworkImageProvider(
          //     imageUrl,
          //   ),
          //   fit: BoxFit.contain,
          // ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.amber),
      height: 400,
      width: 400,
      child: imageUrl.isEmpty
          ? Center(
              child: Icon(
                Icons.image_search,
                size: 64,
                color: Colors.white,
              ),
            )
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              errorWidget: (context, param, _) => Center(
                child: Icon(
                  Icons.image_search,
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  Widget buildButton(VoidCallback onTap, IconData icon, Alignment alignment1,
      Alignment alignment2) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey.shade200,
      child: Center(
        child: Container(
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicators() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: widget.images.length,
      effect: ExpandingDotsEffect(
        activeDotColor: Colors.amber,
        dotColor: Colors.black.withAlpha(50),
      ),
    );
  }

  void nextImage() => _controller.nextPage();

  void previousImage() => _controller.previousPage();
}
