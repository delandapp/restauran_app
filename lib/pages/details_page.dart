import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restauran_app/models/Restoran.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restauran_app/style/theme.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = '/detail_page';
  final Restaurants restaurants;
  const DetailsPage({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RestauranPaths(restaurants: restaurants)),
    );
  }
}

// ignore: must_be_immutable
class RestauranPaths extends StatelessWidget {
  Restaurants restaurants;
  RestauranPaths({super.key, required this.restaurants});

  // !Di dalam LearningPathList tambahkan fungsi yang akan mengembalikan widget SliverPersistentHeader.
  SliverPersistentHeader _header(String img) {
    return SliverPersistentHeader(
      pinned: true,
      //* Parameter delegate harus diisi dengan kelas SliverPersistentHeaderDelegate. Karena kelas ini merupakan abstract class, maka kita perlu membuat kelas implementasinya terlebih dulu.
      delegate: SliverAppBarDelegate(
        minHeight: 100,
        maxHeight: 180,
        child: Hero(
          tag: img,
          child: Image.network(
            img,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader _headerMenu() {
    return SliverPersistentHeader(
      pinned: true,
      //* Parameter delegate harus diisi dengan kelas SliverPersistentHeaderDelegate. Karena kelas ini merupakan abstract class, maka kita perlu membuat kelas implementasinya terlebih dulu.
      delegate: SliverAppBarDelegate(
          minHeight: 80,
          maxHeight: 80,
          child: ColoredBox(
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Info",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey[350]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Menu",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.amber[900]),
                          ),
                          Container(
                            width: 35,
                            height: 2,
                            color: Colors.amber[900],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Rate",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey[350]),
                          ),
                        ],
                      ),
                    ]),
                const Divider()
              ],
            ),
          )),
    );
  }

  Widget _buildTile(Restaurants restaurant) {
    return ListTile(
      title: Text(restaurant.name.toString()),
      subtitle: Text(
        restaurant.description.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //! Di sini kita akan menggunakan widget CustomScrollView. Widget ini adalah widget ScrollView yang membuat efek custom scroll dengan Slivers. Widget ini memiliki parameter slivers yang mirip dengan children. Isi parameter tersebut dengan widget sliver yang ingin ditampilkan.
      //? Parameter slivers hanya boleh diisi dengan widget sliver. Karena itulah kita akan gunakan widget SliverListuntuk menampilkan list.

      slivers: [
        _header(restaurants.pictureId.toString()),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      restaurants.name.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                          itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber[900]!,
                              ),
                          itemCount: 5,
                          rating: restaurants.rating!,
                          itemSize: 20),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(restaurants.rating.toString())
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "Indonesia ➤ ${restaurants.city.toString()}",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      restaurants.description.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        _headerMenu(),
        SliverList(
          delegate: SliverChildListDelegate(
            restaurants.menus!.foods!
                .map((e) => CardMenuFood(menus: e))
                .toList(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            restaurants.menus!.drinks!
                .map((e) => CardMenuFood(menus: e))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CardMenuFood extends StatelessWidget {
  var menus;
  CardMenuFood({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.16),
              offset: const Offset(1, 2),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              menus.runtimeType == Foods ? "assets/images/burger.png" : "assets/images/drinks.png",
              width: 100,
              height: 100,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                    height: 10,
                  ),
                Text(
                  menus.name.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    "Indulge in the flavors of Italy with our pizza, a culinary masterpiece that will transport your taste buds to the rolling hills of Tuscany. Our crispy, hand-tossed crust is topped with a rich and creamy sauce made with the finest San Marzano tomatoes, fresh basil, and a sprinkle of Parmesan cheese",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.check_mark_circled,
                      color: Colors.amber[900],
                      size: 10,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Popular",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.amber[900], fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
