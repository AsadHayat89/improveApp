class AddLogoModel {
  String ? documentId;
  // String? description;
  var image;
  // String? isfavorite;
  // String? iscompleted;
  // String? uid;
  // var price;
  // var title;
  // String? category;
  AddLogoModel(
      {
        // this.description,
        // this.uid,
        // this.price,
        // this.category,
        this.image,
        // this.title,
        // this.isfavorite,
        // this.iscompleted,
        this.documentId,

      });

  factory AddLogoModel.fromMap(map) {
    return AddLogoModel(
      // uid: map["uid"],
      // category: map["category"],
      // description: map["description"],
      documentId: map['docId'],
      // price: map["price"],
      // title: map["title"],
      // isfavorite: map["isfavorite"],
      // iscompleted: map["iscompleted"],
      image: map["image"],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      // "uid": uid,
      // "description": description,
      // "price": price,
      // "category": category,
      // "title": title,
      // "isfavorite": isfavorite,
      // "iscompleted": iscompleted,
      "image": image,
      'docId' : documentId
    };
  }


}