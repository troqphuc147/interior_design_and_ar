class Guide {
  String question;
  String content;
  Guide({required this.content, required this.question});
}

List<Guide> listGuide = [
  Guide(
      question: "What is the ARFuni?  What can I use it for?",
      content:
          "The application will introduce to users the latest and most modern products. In addition, you can chat with our staff to find the most suitable product for your own house."),
  Guide(
      question: "Can I use ARFuni in other devices?",
      content:
          "Yes, in case you registered Money Man account. You only need to login in other devices to continue use Money Man. We only support Android right now"),
  Guide(
      question: "How to view model in camera.",
      content:
          "You can press to product and go to it's detail.Then, press \"View on camera\""),
  Guide(
      question: "How to buy funitures in app?",
      content:
          "You can message the support person directly, when you are sure email us, you can find it in the profile. We will contact you and sign a contract with you."),
  Guide(question: "How to rating for product?", content: ""),
  Guide(question: "How to change account?", content: ""),
  Guide(question: "How to add funiture to my favorites?", content: ""),
  Guide(question: "How to delete funiture in my favorites?", content: ""),
  Guide(question: "How to find funiture?", content: ""),
  Guide(question: "How to show funiture with filter?", content: ""),
  Guide(question: "How to sort funiture by something?", content: ""),
  Guide(question: "How to view all my rating?", content: ""),
];
