class Slide {
  String? title;
  String content;
  String imagePath;
  Slide({this.title, required this.content, required this.imagePath});
}

List<Slide> listSlide = [
  Slide(
      title: "ARFurni",
      content: "We help you choose\nthe best furniture for your house",
      imagePath: "assets/images/white_logo.png"),
  Slide(
      title: "Visually",
      content: "Easily view products on your camera\n",
      imagePath: "assets/images/view_ar.png"),
  Slide(
      title: "Quality",
      content: "Choose your favorite top quality products\n",
      imagePath: "assets/images/after_buy.jpg")
];
