import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/app_colors.dart';
import 'dart:ui';

class HotelCardDetails {
  bottomhotel(BuildContext context) {
    List<String> imageUrl = [
      'https://wise.com/imaginary-v2/650ee6b8239de6ec83225fc45405a7df.jpg',
      'https://wise.com/imaginary-v2/a49171872eda7f7d708537733b7bbf04.jpg',
      'https://wise.com/imaginary-v2/b8f952e8fbfa8d2691e4954e417e7914.jpg',
      'https://wise.com/imaginary-v2/078c439b3cabe3daed100f58df7b31bd.jpg'
    ];

    // List Carousel Images
    final List<Widget> images = [
      carouselimage(imageUrls: imageUrl[0]),
      carouselimage(imageUrls: imageUrl[1]),
      carouselimage(imageUrls: imageUrl[2]),
      carouselimage(imageUrls: imageUrl[3]),
    ];

    int len_of_images = imageUrl.length;
    int activeIndex = 0; // Track the active index
    int activeIndex_carousel = 1;

    showModalBottomSheet(
      backgroundColor: AppColors.primaryColor,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 1.0, // Full height
            builder: (_, controller) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: controller, // Enable scroll control
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent),
                              child: CarouselSlider(
                                items: images,
                                options: CarouselOptions(
                                  height: 350,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setModalState(() {
                                      activeIndex = index;
                                      activeIndex_carousel = activeIndex + 1;
                                    });
                                  },
                                ),
                              ),
                            ),
                            // Carousel Indicator and Navigation Controls
                            Positioned(
                              bottom: 20,
                              left: 325,
                              child: Container(
                                width: 44,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(83, 1, 0, 0)
                                      .withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "$activeIndex_carousel",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text("/",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11)),
                                      Text("$len_of_images",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(images.length, (index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: index == activeIndex
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      shape: BoxShape.circle,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color.fromARGB(87, 0, 0, 0)
                                            .withOpacity(0.6),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the bottom sheet
                                        },
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                      ],
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color.fromARGB(87, 0, 0, 0)
                                            .withOpacity(0.6),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.share_arrival_time,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Close the bottom sheet
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 19, right: 16, top: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Entire cabin in Lillehammer",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Text(
                                    " 4.92 (116 reviews)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const Divider(
                                height: 20.0,
                                thickness: 1.0,
                                color: Color.fromARGB(255, 205, 204, 204),
                                indent: 3.0,
                                endIndent: 6.0,
                              ),
                            ],
                          ),
                        ),

                        //Entire home
                        Padding(
                          padding: EdgeInsets.only(left: 6.0, right: 0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 0),
                            decoration: BoxDecoration(),
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 7),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Entire Home",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, left: 10),
                                            child: Text(
                                              "Hosted by Isebelle",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        30), // Semi-transparent black
                                  ),
                                  height: 62,
                                  width: 62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 198, 198, 198),
                                        radius: 100,
                                        backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20100w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20200w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20300w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20400w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20500w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20600w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20700w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20800w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%20900w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%201000w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%201200w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%201400w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%201600w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%201800w,%20https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=2000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXZhdGFyfGVufDB8fDB8fHww%202000w')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 20.0,
                          thickness: 1.0,
                          color: Color.fromARGB(255, 205, 204, 204),
                          indent: 20.0,
                          endIndent: 20.0,
                        ),

                        //Amenities
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 22, bottom: 10),
                              child: Text(
                                "Amenities",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: [
                                chip_amenities(
                                  word: "Wi-Fi",
                                ),
                                chip_amenities(
                                  word: '65" HDTV',
                                ),
                                chip_amenities(
                                  word: "Indoor fireplace",
                                ),
                                chip_amenities(
                                  word: "Hair dryer",
                                ),
                                chip_amenities(
                                  word: "Washing machine",
                                ),
                                chip_amenities(
                                  word: "Dryer",
                                ),
                                chip_amenities(
                                  word: "Refrigeator",
                                ),
                                chip_amenities(
                                  word: "Dishwasher",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            const Divider(
                              height: 20.0,
                              thickness: 1.0,
                              color: Color.fromARGB(255, 205, 204, 204),
                              indent: 20.0,
                              endIndent: 20.0,
                            ),
                          ],
                        ),

                        //self check-in
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 19, right: 16, top: 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person_pin_circle),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Self check-in",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Check yourself in with the lockbox",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        //great check in experience
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 22, right: 16, top: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.vpn_key),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Great check-in experience",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Text(
                                      "100% of recent gave the check-in process a 5-star rating",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 100,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Navigation Bar positioned at the bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildBottomNavigationBar(),
                  ),
                ],
              );
            },
          );
        });
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Color.fromARGB(255, 0, 0, 0), // Semi-transparent black
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Row(
                    children: [
                      Text(
                        "18-21Oct . 3 nights",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: Row(
                    children: [
                      Text(
                        "\$384",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            )),
            //----------------------------------

            Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Semi-transparent black
                ),
                height: 60,
                child: Container(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 8),
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ))),
            //----------------------------------
          ],
        ),
      ),
    );
  }
}

class carouselimage extends StatelessWidget {
  final String imageUrls;

  const carouselimage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(55),
        bottomLeft: Radius.circular(55),
      ),
      child: Image.network(
        imageUrls,
        height: 200, // Set a height if needed
        width: double.infinity, // Set width to fill the available space
        fit: BoxFit.cover, // Adjust how the image should fit in the box
      ),
    );
  }
}

//Chip Amenities
class chip_amenities extends StatefulWidget {
  final String word;
  const chip_amenities({super.key, required this.word});

  @override
  State<chip_amenities> createState() => _chip_amenitiesState();
}

class _chip_amenitiesState extends State<chip_amenities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.08),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        child: Text(
          widget.word,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
