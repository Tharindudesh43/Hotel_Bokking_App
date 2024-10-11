import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Material components for the UI
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/screens/hotel_card_details.dart';
import 'package:hotel_booking_app/utils/app_colors.dart'; // Custom app colors
import 'package:hotel_booking_app/widgets/search_bar_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> imageUrls = [
    'https://wise.com/imaginary-v2/650ee6b8239de6ec83225fc45405a7df.jpg',
    'https://wise.com/imaginary-v2/a49171872eda7f7d708537733b7bbf04.jpg',
    'https://wise.com/imaginary-v2/b8f952e8fbfa8d2691e4954e417e7914.jpg',
    'https://wise.com/imaginary-v2/078c439b3cabe3daed100f58df7b31bd.jpg'
  ];
  static int selectedIndex = -1;
  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomsheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.showbottomsheetColor,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 1.0, // Full height
            builder: (_, controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, right: 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the bottom sheet
                            },
                          ),
                          //SizedBox(height: 10),
                          const Text(
                            "Search",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.tune)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: SearchBar(
                      mainText: "Norway",
                      seachBarColor: Colors.white,
                      secondaryText: "18 - 21Oct - 4 guests",
                      textColor: Colors.black,
                      which_Bar: "Search_Bottom",
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonContainer(
                          textvlaue: "Any type",
                          buttonColor: selectedIndex == 0
                              ? Colors.black
                              : Colors.transparent,
                          textvalueColor:
                              selectedIndex == 0 ? Colors.white : Colors.black,
                          index: 0,
                          onTap: () => updateSelectedIndex(0),
                        ),
                        ButtonContainer(
                            textvlaue: "Room",
                            buttonColor: selectedIndex == 1
                                ? Colors.black
                                : Colors.transparent,
                            textvalueColor: selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                            index: 1,
                            onTap: () => updateSelectedIndex(1)),
                        ButtonContainer(
                          textvlaue: "Entire Room",
                          buttonColor: selectedIndex == 2
                              ? Colors.black
                              : Colors.transparent,
                          textvalueColor:
                              selectedIndex == 2 ? Colors.white : Colors.black,
                          index: 2,
                          onTap: () => updateSelectedIndex(2),
                        ),
                      ],
                    ),
                  ),
                  //----------------
                  Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: HotelCard(),
                          );
                        }),
                  ),
                ],
              );
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 241, 241),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 208,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.65), BlendMode.darken),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.telegram_sharp,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                " Norway",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.person_2_rounded,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Hey, Martin! Tell us where you                want to go",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      SearchBar(
                        mainText: "Search places",
                        seachBarColor: Colors.grey.shade600.withOpacity(0.2),
                        secondaryText: "Data Range - Number of guests",
                        textColor: Colors.white,
                        which_Bar: "Discover_Page",
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: const Text(
              "The most relevant",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SizedBox(
              height: 310, //282
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: HotelCard(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              "Discover new places",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black),
                        width: 150,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HotelCardDetails obj = new HotelCardDetails();
        obj.bottomhotel(context);
      },
      child: SizedBox(
        height: 325,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 310, //310
            height: 300, //100
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                          'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: const Color.fromARGB(87, 0, 0, 0)),
                        child: Center(
                          child: Icon(
                            Icons.favorite_outline,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tiny Home in Roelingen",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                          ),
                          Text("4.96 (217)",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13))
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                  child: Row(
                    children: [
                      FacilityItem(
                        facilityName: "4 guest",
                      ),
                      FacilityItem(
                        facilityName: "2 bedrooms",
                      ),
                      FacilityItem(facilityName: "2 beds"),
                      FacilityItem(facilityName: "1 bathroom"),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    children: [
                      PriceTags(
                          PreviousPrice: "117",
                          NightPrice: "91",
                          TotalPrice: "273")
                    ],
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

//ButtonContainer
class ButtonContainer extends StatefulWidget {
  final String textvlaue;
  final Color buttonColor;
  final Color textvalueColor;
  final int index;
  final VoidCallback onTap;
  const ButtonContainer(
      {super.key,
      required this.textvlaue,
      required this.buttonColor,
      required this.textvalueColor,
      required this.index,
      required this.onTap});

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Call the passed function on tap
      child: Container(
        width: 105,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
          color:
              widget.buttonColor, // Color changes based on the selected index
        ),
        child: Center(
          child: Text(
            widget.textvlaue,
            style: TextStyle(
              color: widget.textvalueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

//price class
class PriceTags extends StatelessWidget {
  const PriceTags(
      {super.key,
      required this.PreviousPrice,
      required this.NightPrice,
      required this.TotalPrice});

  final String PreviousPrice;
  final String NightPrice;
  final String TotalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.euro,
          size: 13,
          color: Colors.black.withOpacity(0.6),
        ),
        Text(PreviousPrice,
            style: TextStyle(
                fontSize: 10,
                decoration: TextDecoration.lineThrough,
                color: Colors.black.withOpacity(0.6))),
        const SizedBox(width: 3),
        Icon(Icons.euro, size: 13, color: Colors.black.withOpacity(0.6)),
        Text(NightPrice, style: TextStyle(fontSize: 10)),
        const SizedBox(width: 3),
        Text("night", style: TextStyle(fontSize: 11)),
        SizedBox(width: 3),
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.6)),
        ),
        const SizedBox(width: 3),
        Icon(Icons.euro, size: 13, color: Colors.black.withOpacity(0.5)),
        Text(TotalPrice,
            style:
                TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.6))),
        const SizedBox(width: 3),
        Text("total",
            style:
                TextStyle(fontSize: 11, color: Colors.black.withOpacity(0.5)))
      ],
    );
  }
}

//Facilities Item
class FacilityItem extends StatelessWidget {
  const FacilityItem({super.key, required this.facilityName});

  final String facilityName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 3,
          height: 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black.withOpacity(0.6)),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          facilityName,
          style: TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.6)),
        )
      ],
    );
  }
}

//Search Bar Class
class SearchBar extends StatefulWidget {
  final String mainText;
  final String secondaryText;
  final Color seachBarColor;
  final Color textColor;
  String which_Bar;
  SearchBar(
      {super.key,
      required this.mainText,
      required this.secondaryText,
      required this.seachBarColor,
      required this.textColor,
      required this.which_Bar});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.which_Bar == "Discover_Page") {
            _DiscoverScreenState().bottomsheet(context);
          }
          if (isPressed == false) {
            isPressed = true;
          } else {
            isPressed = false;
          }
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: widget.seachBarColor,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: widget.textColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                isPressed
                    ? const SizedBox(width: 250, height: 30, child: TextField())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.mainText,
                            style: TextStyle(
                                color: widget.textColor, fontSize: 13),
                          ),
                          Text(
                            widget.secondaryText,
                            style: TextStyle(
                                color: widget.textColor.withOpacity(0.5),
                                fontSize: 11),
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
