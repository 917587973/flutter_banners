import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CustomCarousel extends StatefulWidget {
  final List<String> imageUrls;
  CustomCarousel({this.imageUrls});
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height:MediaQuery.of (context).size.height,

        child:Align(
          alignment: Alignment.center,
        child: Stack(children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 0,
        autoPlayCurve: Curves.fastOutSlowIn),
        items: widget.imageUrls.map((i) {
          return Builder(builder: (BuildContext context) {
            return Container(
                child: FadeInImage(
              image: NetworkImage(i),
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/placeholders.jpg'),
            ));
          });
        }).toList(),
      ),
      Positioned(
          bottom: 8,
          right: 8,
          child: Container(
              height: 12,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: 5,
                            width: index == pageIndex ? 15 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.blue,
                            )));
                  })))
    ]))
    );
  }
}
