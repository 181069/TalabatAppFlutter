import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proj2fatisr/main.dart';
import 'package:proj2fatisr/resturants.dart';
import 'package:proj2fatisr/loading2.dart';


class MapPage extends StatefulWidget {
  final List<Res> resturants;
  MapPage(this.resturants);




  @override
  _MapPageState createState() => _MapPageState(resturants);
}

class _MapPageState extends State<MapPage> {
  List<Res> resturants;

  Completer<GoogleMapController> _controller = Completer();

  _MapPageState(this.resturants);





  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => MyApp(),));
            }),
        title: Text("Talabat Map"),
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(FontAwesomeIcons.search),
          //     onPressed: () {
          //       //
          //     }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer( resturants),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(31.31541, 35.05328), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(31.31541, 35.05328), zoom: zoomVal)));
  }


  Widget _buildContainer(List<Res> resturants) {


    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 270.0,
        child:  Expanded(

          child: ListView.builder(

            scrollDirection:Axis.horizontal ,
            itemCount:resturants.length ,
            itemBuilder:(context, index) {
              return  Container(

                child: Column(

                  children: [
                    Container(

                      height: 250,
                      margin: const EdgeInsets.all(2),
                      child: Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        shadowColor: Colors.black,
                        elevation: 50,
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //this one
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                // width: MediaQuery.of(context).size.width,
                                height: 150,
                                width:300 ,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("http://appback.ppu.edu/static/${resturants[index].image}"),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.start ,
                                crossAxisAlignment:CrossAxisAlignment.center ,
                                children: [

                                  Container(
                                    margin:const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          resturants[index].name,
                                          style: TextStyle(color: Colors.black, fontSize: 15),
                                        ),
                                        Text(
                                          resturants[index].city,
                                          style: TextStyle(color: Colors.black, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                    crossAxisAlignment:CrossAxisAlignment.center ,
                                    children: [

                                      GestureDetector(
                                        child:CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          child: Icon(
                                            Icons.location_on,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          minRadius: 20,
                                          maxRadius: 20,
                                        ),
                                        onTap:() {
                                          print(resturants);
                                          _gotoLocation(double.parse(resturants[index].lat)  , double.parse(resturants[index].lng)  );
                                        } ,
                                      ),
                                      Container(
                                        margin:const EdgeInsets.fromLTRB(6, 0, 0, 0),

                                        child: RatingBar.builder(
                                          itemSize:20,

                                          initialRating: resturants[index].rating/2,
                                          minRating: 1,
                                          ignoreGestures:true,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,

                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      )

                                    ],
                                  ),
                                ],
                              ),
                            ),

                            //LIST CONTAINERS
                          ],
                        ),
                      ),
                    ),
                    //icon containers
                  ],
                ),
              );
            },),
        ),
      ),
    );
  }




  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(31.31541, 35.05328), zoom: 11),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          HebronMarker,CityMarker,BurgerMarker,wardMarker,ZuwarMarker,PizaMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker wardMarker = Marker(
  markerId: MarkerId('Ward'),
  position: LatLng(31.31541, 35.05328),
  infoWindow: InfoWindow(title: 'Ward Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker ZuwarMarker = Marker(
  markerId: MarkerId('Zuwar'),
  position: LatLng(31.31541, 35.05328),
  infoWindow: InfoWindow(title: 'Zuwar Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker PizaMarker = Marker(
  markerId: MarkerId('Piza Home'),
  position: LatLng(31.31541, 35.05328),
  infoWindow: InfoWindow(title: 'Piza Home Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker HebronMarker = Marker(
  markerId: MarkerId('Hebron'),
  position: LatLng(3145543, 35545454),
  infoWindow: InfoWindow(title: 'Hebron Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker CityMarker = Marker(
  markerId: MarkerId('City'),
  position: LatLng(31.232323, 35.34354),
  infoWindow: InfoWindow(title: 'Ciy Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker BurgerMarker = Marker(
  markerId: MarkerId('Burger'),
  position: LatLng(31.232323,35.34354),
  infoWindow: InfoWindow(title: 'Burger King'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker youMarker = Marker(
  markerId: MarkerId(' You Burger'),
  position: LatLng(31.232323,35.34354),
  infoWindow: InfoWindow(title: 'You Burger'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker BuffaloMarker = Marker(
  markerId: MarkerId('Buffalo'),
  position: LatLng(31.232323,35.34354),
  infoWindow: InfoWindow(title: 'Buffalo Resturant'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);