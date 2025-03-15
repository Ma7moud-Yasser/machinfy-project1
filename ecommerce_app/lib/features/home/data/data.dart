import 'package:ecommerce_app/features/home/presentaion/components/details_item_screen.dart';

class HomeData {
  static const List<Map<String, dynamic>> categories = [
    {'name': "Watches", "image": ""},
    {
      'name': "Electronics",
      "image":
          "https://i.pinimg.com/736x/43/15/ae/4315ae69df9daa2550203db798b0d77f.jpg",
    },
    {
      'name': "Shoes",
      "image":
          "https://i.pinimg.com/736x/c5/7a/be/c57abe4f070b63fab6378f3cfd8dcfcb.jpg",
    },
    {
      'name': "Phone",
      "image":
          "https://i.pinimg.com/736x/26/be/56/26be56634ad9773c9d8f6315cac2cba7.jpg",
    },
    {
      'name': "Bags",
      "image":
          "https://i.pinimg.com/736x/46/09/01/460901624ef0fd9cab92dabf23033b14.jpg",
    },
  ];
  static const List<Map<String, dynamic>> sliderItems = const [
    {
      "image":
          "https://i.pinimg.com/736x/27/8e/46/278e46ef553cc3176963ed0d52077cdd.jpg",
      "title": "Elegant Black Watch",
      "subtitle": "Discover timeless elegance.",
      "page": DetailPage(title: "Page 1"),
    },
    {
      "image":
          "https://i.pinimg.com/736x/73/8c/66/738c66a1e117f638020803ff8c6a6575.jpg",
      "title": "Luxury Silver Watch",
      "subtitle": "Refined style for modern times.",
      "page": DetailPage(title: "Page 2"),
    },
    {
      "image":
          "https://i.pinimg.com/736x/f1/ca/4a/f1ca4a2b4143a4ce875b20261bc91a4c.jpg",
      "title": "Classic Leather Watch",
      "subtitle": "Vintage charm meets innovation.",
      "page": DetailPage(title: "Page 3"),
    },
  ];
}
