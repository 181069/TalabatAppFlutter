class RestuItem{

 int id;
  int rest_id;
 String name;
 String descr;
  int price;
  String image;
  double rating;

 RestuItem({this.id, this.rest_id, this.name, this.descr, this.price,
      this.image, this.rating});


 factory RestuItem.fromJson(dynamic jsonObject) {
    return RestuItem(
      id: jsonObject['id'] as int,
      rest_id: jsonObject['rest_id'] as int,
      name: jsonObject['name'] as String,
      descr: jsonObject['descr'] as String,
      price: jsonObject['price'] as int,
      image: jsonObject['image'] as String,
      rating: jsonObject['rating'] as double,
      //jsonObject[''] as,
    );
  }

}