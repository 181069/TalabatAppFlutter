class Res {
  int id;
  //{"id":10,"name":"Buffalo","city":"BethLahem","lat":"31.232323","lng":"35.34354","phone":"5554444","image":"rest8.jpeg","rating":7}
  String name;
  String city;
  String lat;
  String lng;
  String phone;
  String image;
  int rating;

  Res(
      {this.id,
      this.name,
      this.city,
      this.lat,
      this.lng,
      this.phone,
      this.image,
      this.rating});

  factory Res.fromJson(dynamic jsonObject) {
    return Res(
      name: jsonObject['name'] as String,
      city: jsonObject['city'] as String,
      lat: jsonObject['lat'] as String,
      lng: jsonObject['lng'] as String,
      phone: jsonObject['phone'] as String,
      image: jsonObject['image'] as String,
      rating: jsonObject['rating'] as int,
      //jsonObject[''] as,
    );
  }
}
