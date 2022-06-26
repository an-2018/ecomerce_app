# NusaBomApp

## The concept
An e-commerce app build for web and mobile, with the following features
- List products from an api
- Add products to favorites list
- Add products to cart
- Search for products by name and other fields

## Design
Inspired on designs from dribble and Behance, some of the links bellow:
- https://www.behance.net/gallery/135792591/eCommerce-app?tracking_source=search_projects%7CE%20COMMERCE%20app
- https://www.behance.net/gallery/140855537/NFTs-Platform
- https://dribbble.com/shots/18206861-Artello-Creative-NFT-Ecommerce-Auction-App

## How to run
- Clone the repo and grab the flutter dependencies by running:
```bash
git clone  <repo-link>
cd frontend
flutter pub get
flutter run -d chrome --web-renderer html
```
> Flag html so that some images get rendered by the flutter html render due to problems with CORS

- Otherwise use an IDE to build the APK for the android app version

## Resources used
- Packages
  * Flutter web plugins - detect device platform 
    <!-- TODO: add an image/gif of the feature-->
  * Http - make requests to api
    * https://pub.dev/packages/http
    <!-- TODO: add an image/gif of the feature -->
  * Carousel Slider - build a wrapper to handle carousel in flutter
    * https://pub.dev/packages/carousel_slider/install
    <!-- TODO: add an image/gif of the feature -->
  * Smooth Page Indicator
    * https://pub.dev/packages/smooth_page_indicator
    <!-- TODO: add an image/gif of the feature-->
  * Provider - state mmanagement
    * https://pub.dev/packages/provider
  * Lazy load scrollview - lazy loading / infinit scroll
    * https://pub.dev/packages/lazy_load_scrollview

