import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselExample extends StatelessWidget {
  const CarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    List names = [
      klaslar(
        claim: "Claim voucher",
        foiz: "30",
        ism: "Get special discount",
        image: "img/food5.jpg",
      ),
      klaslar(
        claim: "Claim turkey",
        foiz: "10",
        ism: "Turkish doner",
        image: "img/food3.jpg",
      ),
      klaslar(
        claim: "Claim kebab",
        foiz: "32",
        ism: "Kebab",
        image: "img/food2.jpg",
      ),
      klaslar(
        claim: "Claim iskandar",
        foiz: "10",
        ism: "Turkish iskandar",
        image: "img/food4.jpg",
      ),
    ];

    return Center(
      child: Container(
        width: double.infinity,
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: 0.8,
          ),
          items: names.map((e) => template(e)).toList(),
        ),
      ),
    );
  }
}

//klass
class klaslar {
  String? ism;
  String? image;
  String? foiz;
  String? claim;
  klaslar({this.ism, this.foiz, this.claim, this.image});
}

Widget template(dog) {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image:
            DecorationImage(image: AssetImage(dog.image), fit: BoxFit.cover)),
    child: Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dog.ism,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "up to  ${dog.foiz}%",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(5),
            child: Text(
              dog.claim,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
