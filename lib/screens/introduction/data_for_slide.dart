class Slide {
  String? title;
  String content;
  String imagePath;
  Slide({this.title, required this.content, required this.imagePath});
}

List<Slide> listSlide = [
  Slide(
      title: "ARFurni",
      content: "We will help you choose\nthe best furniture for your house",
      imagePath: "assets/images/white_logo.png"),
  Slide(
      title: "Visually",
      content: "View products with your camera\n",
      imagePath: "assets/images/view_ar.png"),
  Slide(
      title: "Quality",
      content: "Decoration your house with them\n",
      imagePath: "assets/images/after_buy.jpg")
];
