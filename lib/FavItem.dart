class FavItem{
  int id;
  String rest_Name;
  String name;
  String descr;
  String image;
 int price;


  FavItem({this.id, this.rest_Name, this.name, this.descr, this.image, this.price});

  factory FavItem.fromMap(Map<String, dynamic> data) {
    return FavItem(
      id: data['id'],
      rest_Name: data['rest_Name'],
      name: data['name'],
      descr:data['descr'],
      image: data['image'],
      price: data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'rest_Name': this.rest_Name,
      'name': this.name,
      'descr':this.descr,
      'image': this.image,
      'price': this.price
    };
  }




}