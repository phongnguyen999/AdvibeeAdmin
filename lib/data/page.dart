class Page {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String button;
  final String buttonUrl;

  const Page(
      {this.image,
      this.title,
      this.subtitle,
      this.description,
      this.button,
      this.buttonUrl});

  static Page first() => Page(
      image: "assets/advicebeephone.jpg",
      title: "Expert advice at your fingertips",
      subtitle: "Introducing the AdviceBee App!",
      description:
          "Join us and share the knowledge",
      button: "Download",
      buttonUrl: "");

  static Page second() => Page(
      image: "assets/advicebeephone2.jpg",
      title: "",
      subtitle: "",
      description: "",
      button: null,
      buttonUrl: "");

  static List<Page> all() => [
    first(),
    second(),
  ];
}
