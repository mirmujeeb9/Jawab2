class Conjugaison2_Model {
  String? texts;
  String? button_texts;
  Conjugaison2_Model({
    required this.texts,
    required this.button_texts,
  });
  static List<Conjugaison2_Model> list = [
    //0
    Conjugaison2_Model(texts: "جَعَلْتُ", button_texts: "(anā) أنا"),
    //1
    Conjugaison2_Model(texts: "جَعَلْتَ", button_texts: "(anta) انتَ"),
    //2
    Conjugaison2_Model(texts: "جَعَلْتِ", button_texts: "(anti) انتِ"),
    //3
    Conjugaison2_Model(texts: "جَعَلْتُمَا", button_texts: "(antumā) أنتما"),
    //4
    Conjugaison2_Model(texts: "جَعَلَ", button_texts: "(huwa) هو"),
  ];
}
