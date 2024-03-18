class Conjugaison1_Model {
  String? texts;
  Conjugaison1_Model({
    required this.texts,
  });
  static List<Conjugaison1_Model> mylist = [
    //0
    Conjugaison1_Model(texts: "تعلم"),
    //1
    Conjugaison1_Model(texts: "اشترى"),
    //2
    Conjugaison1_Model(texts: "أحبّ"),
    //3
    Conjugaison1_Model(texts: "أعلن"),
    //4
    Conjugaison1_Model(texts: "توقّف"),
    //5
    Conjugaison1_Model(texts: "حضر"),
    //6
    Conjugaison1_Model(texts: "ساعد"),
    //7
    Conjugaison1_Model(texts: "وصل"),
// 8
    Conjugaison1_Model(texts: "انتظر"),
  ];
}

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
