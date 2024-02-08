// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/dashboard/categories.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/dashboard/home_header.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/dashboard/image_slider_dashboard.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/dashboard/product_card_scroll.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/dashboard/special_offer_card.dart';
import 'package:flutter_mobile/SiHALAL-ecommerce-app/widgets/little_particle.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // * harusnya ini body-nya pake safearea, tapi karena biar
      // * lebih mudah maintain warna header, jadi ga pake safearea
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ImageSlider(),
                  SizedBox(height: 30),
                  Categories(),
                  SizedBox(height: 30),
                  SpecialOfferCard(),
                  SizedBox(height: 40),
                  ProductCardRowScroll(
                    color: '#B1E9AC',
                    cardHeader: "Cek Produk Terbaru di SiHALAL",
                  ),
                  SizedBox(height: 40),
                  ProductCardRowScroll(
                    color: '#FE5959',
                    cardHeader: 'Kebutuhan Masakan Kamu',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
