import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj2fatisr/FavPage.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'ProviderTalabat.dart';
import 'resturantitem.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'orderedmenue.dart';
import 'ordereditems.dart';
class Menu extends StatefulWidget {
  final List<RestuItem> menues;
  final String resName;
  Menu(this.menues, this.resName);

  @override
  _MenuState createState() => _MenuState(menues,resName);
}

class _MenuState extends State<Menu> {
  List<RestuItem> menues;
  String resName;
  _MenuState(this.menues,this.resName);

  @override
  Widget build(BuildContext context) {
    var menitem = Provider.of<ProviderTalabat>(context);
   List<OrderedItem> ordereditem=[];

    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red[700],
        title: Text('Menu for $resName resturant',style:TextStyle(fontFamily:'ArchitectsDaughter Regular' ,fontSize:20 ) ,),),
      body:Column(

        children: [
          Container(
            padding:EdgeInsets.fromLTRB(40, 0, 40, 0) ,
            margin:EdgeInsets.fromLTRB(0, 10, 0, 7) ,
            child: Container(
              padding:EdgeInsets.fromLTRB(15, 0, 15, 0) ,
              child: DottedBorder(
                color: Colors.red[700],
                dashPattern: [12,12, 12, 12],
                strokeWidth:3,
                child: Text('$resName board  ',style:TextStyle(fontSize:20,color: Colors.red[700],fontFamily:'ArchitectsDaughter Regular') ,textAlign:TextAlign.center ,),
              ),
            ),
          ),

          Container(
            height:170,
            child:CarouselSlider(
              options: CarouselOptions(height: 160.0,autoPlay: true,),
              items: [
                'https://cdn4.vectorstock.com/i/1000x1000/93/78/welcome-to-our-restaurant-chalkboard-printable-vector-6719378.jpg',
                'https://png.pngtree.com/png-clipart/20190705/original/pngtree-classic-big-sale-discount-label-with-stroke-illustration-png-image_4346265.jpg',
                'https://png.pngtree.com/png-clipart/20190515/original/pngtree-black-friday-sale-banner-abstract-background-png-image_3700367.jpg',
                'https://sahhawhana.com/mwfiles/thumbs/fit630x300/22644/1589935314/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9_%D8%B9%D9%85%D9%84_%D9%88%D8%B1%D9%82_%D8%B9%D9%86%D8%A8_%D8%A8%D8%A7%D9%84%D8%B9%D8%AF%D8%B3.jpg'].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Image.network(i,fit:BoxFit.fill ,)
                    );
                  },
                );
              }).toList(),
            ),
          ),
          //special design container

          //text containeer
          Container(
            padding:EdgeInsets.fromLTRB(40, 0, 40, 0) ,
            margin:EdgeInsets.fromLTRB(0, 10, 0, 7) ,
            child: Container(
              padding:EdgeInsets.fromLTRB(15, 0, 15, 0) ,
              child: DottedBorder(
                color: Colors.red[700],
                dashPattern: [12,12, 12, 12],
                strokeWidth:3,
                child: Text('our menue ',style:TextStyle(fontSize:20,color: Colors.red[700],fontFamily:'ArchitectsDaughter Regular') ,textAlign:TextAlign.center ,),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount:menues.length ,
              itemBuilder:(context, index) {
                return Container(
                  child:Column(
                    children: [
                    Row(
                      children: [
                        Container(
                          margin:EdgeInsets.fromLTRB(7, 7, 7, 7),
                          height:160 ,
                          width:140 ,
                          color:Colors.red[700] ,
                          child:Container(
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.amber
                              ),
                              child: Image.network('http://appback.ppu.edu/static/${menues[index].image}',fit:BoxFit.fill ,)
                          ),
                        ),
                        Expanded(
                          child:Column(
                            // mainAxisAlignment:MainAxisAlignment.start ,
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text( menues[index].name,style:TextStyle(fontSize:25,color: Colors.black,fontFamily:'ArchitectsDaughter Regular') ),
                              Text('price: ${menues[index].price} shekel',style:TextStyle(fontSize:20,color: Colors.black,fontFamily:'ArchitectsDaughter Regular')),
                              Text(menues[index].descr,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'ArchitectsDaughter Regular')),
                              Row(
                                children: [
                                  IconButton(icon:Icon(Icons.add) , onPressed: (){
                                    menitem.add(OrderedItem(name:menues[index].name ,price:menues[index].price ,rest_name:resName));
                                    Toast.show('item added to basket succefully', context);
                                  }),
                                  IconButton(icon: Icon(Icons.star), onPressed: (){
                                    menitem.addfav(OrderedItem(name:menues[index].name ,price:menues[index].price ,rest_name:resName));
                                    Toast.show('item added to faviorate list succefully', context);

                                  }),
                                ],
                              ),
                            ],
                          )
                          ,),
                      ],
                    ),
                  ],) ,
                );
                  },),
          ),
        ],
      ),


    );

  }
}
