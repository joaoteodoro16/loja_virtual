import 'package:flutter/material.dart';

import '../tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(this.pageController,{Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white70, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      child: Text(
                        "Flutter's\nClothing",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      top: 8,
                      left: 0,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olá,",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Entre ou cadastre-se >',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(pageController,Icons.home, "Início",0),
              DrawerTile(pageController,Icons.list, "Produtos",1),
              DrawerTile(pageController,Icons.location_on, "Lojas",2),
              DrawerTile(pageController,Icons.playlist_add_check, "Meus pedidos",3),
            ],
          )
        ],
      ),
    );
  }
}
