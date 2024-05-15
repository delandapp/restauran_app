import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restauran_app/data/kategorilist.dart';
import 'package:restauran_app/models/Restoran.dart';
import 'package:restauran_app/pages/details_page.dart';
import 'package:restauran_app/style/theme.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthBody = MediaQuery.of(context).size.width;
    double heightBody = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 70,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipOval(
                            child: Image.network(
                          'https://i.pinimg.com/236x/ff/cc/bf/ffccbf02381f3e50a8b3ad6ad7ddb82e.jpg',
                          width: 20.0,
                        )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Alamat Pengantaran",
                              style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(255, 131, 131, 131)),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Sabrang kulon,Mojosongo",
                              style: GoogleFonts.poppins(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: blackColor,
                    decoration: InputDecoration(
                      hintText: "Cari Restauran Favorit",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 131, 131, 131),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 131, 131, 131),
                      ),
                      fillColor: primaryColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kategori",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 34, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 131, 131, 131),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthBody * 0.05),
                  child: SizedBox(
                    height: heightBody * 0.12,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      categoriesRestauran[index].icon,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                categoriesRestauran[index].name,
                                style: GoogleFonts.poppins(
                                    fontSize: 11, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 40,
                      ),
                      itemCount: categoriesRestauran.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Restauran",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 34, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: FutureBuilder(
                              future: DefaultAssetBundle.of(context)
                                  .loadString('assets/json/data.json'),
                              builder: (context, snapshot) {
                                List mydata = json.decode(
                                    snapshot.data.toString())['restaurants'];
                                List<Restaurants> dataRestauran = mydata.map(
                                  (e) {
                                    return Restaurants.fromJson(e);
                                  },
                                ).toList();

                                return ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  itemCount: dataRestauran.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, DetailsPage.routeName, arguments: dataRestauran[index]);
                                      },
                                      child: CardRestauran(
                                          restaurants: dataRestauran[index]),
                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 30,),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardRestauran extends StatelessWidget {
  Restaurants restaurants;
  CardRestauran({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          tag: restaurants.pictureId.toString(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              restaurants.pictureId.toString(),
              height: 180,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurants.name.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w800),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.star_circle_fill,
                    color: Colors.amber[900],
                    size: 14.0,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(restaurants.rating.toString()),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                restaurants.city.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.money_dollar,
                    color: Colors.amber[900],
                    size: 14.0,
                  ),
                  Icon(
                    CupertinoIcons.money_dollar,
                    color: Colors.amber[900],
                    size: 14.0,
                  ),
                  Icon(
                    CupertinoIcons.money_dollar,
                    color: Colors.grey[900],
                    size: 14.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
