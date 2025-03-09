// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_local_variable, unused_field, depend_on_referenced_packages, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:icraft_project/models/account/chat/chat_ui.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage(
      {Key? key,
      required this.userName,
      required this.location,
      required this.backGroudnPic,
      required this.profilePic,
      required this.nameId,
      required this.followers,
      required this.following,
      required this.review,
      required this.votes,
      required this.bio})
      : super(key: key);
  String profilePic;
  String location;
  String backGroudnPic;
  String nameId;
  String userName;
  String followers;
  String following;
  String bio;
  String review;
  String votes;
  final double coverHeight = 242;
  final double profilePicHeight = 135;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  bool isFollowing = false;
  final double _backGround_height = 380;
  final double _profilePicture_rad = 54;
  List tags = ['Gallery', 'Info'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 238, 250),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.backGroudnPic,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    height: _backGround_height,
                    color: Colors.black12,
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 230, 238, 250),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                    // primary: const Color.fromARGB(
                                    //     255, 230, 238, 250),
                                    // onPrimary: const Color.fromARGB(
                                    //     255, 108, 122, 156), // <-- Splash color
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 25.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 230, 238, 250),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => chat(
                                                profilePic: widget.profilePic,
                                                userName: widget.userName,
                                                nameId: widget.nameId,
                                              )),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                    // primary: const Color.fromARGB(
                                    //     255, 230, 238, 250),
                                    // onPrimary: const Color.fromARGB(
                                    //     255, 108, 122, 156), // <-- Splash color
                                  ),
                                  child: const Icon(
                                    Icons.email,
                                    size: 25.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins_bold",
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.location,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const RatingBar(4),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.review,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 98,
                        ),
                        Stack(clipBehavior: Clip.none, children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 230, 238, 250),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(44),
                                    topRight: Radius.circular(44))),
                            height: 100,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: null,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              55, 12, 0, 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.followers,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins_bold",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const Text(
                                                'Followers',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: null,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 12, 55, 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                widget.following,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins_bold",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const Text(
                                                'Following',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    widget.nameId,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins_bold",
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: _profilePicture_rad,
                            left: MediaQuery.of(context).size.width / 2 -
                                _profilePicture_rad,
                            child: Center(
                              child: CircleAvatar(
                                radius: 54,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage(widget.profilePic),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 108, 122, 202)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: handleFollowButton,
                        style: ElevatedButton.styleFrom(
                            shadowColor:
                                !isFollowing ? Colors.blue : Colors.grey,
                            fixedSize: const Size(120, 40),
                            shape: const StadiumBorder(),
                            elevation: !isFollowing ? 10 : 2,
                            // primary: !isFollowing
                            //     ? const Color.fromARGB(255, 87, 144, 223)
                            //     : Colors.white
                                ),
                        child: !isFollowing
                            ? const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            : const Text(
                                'Unfollow',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 135, 183, 255),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => chat(
                                      profilePic: widget.profilePic,
                                      userName: widget.userName,
                                      nameId: widget.nameId,
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            fixedSize: const Size(120, 40),
                            shape: const StadiumBorder(),
                            elevation: 10,
                            //primary: Colors.white
                            ),
                        child: const Text(
                          'Message',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                width: 150,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      padding: const EdgeInsets.only(top: 5, bottom: 7),
                      isScrollable: true,
                      controller: _tabController,
                      indicatorPadding: const EdgeInsets.only(bottom: 5),
                      labelColor: Colors.black,
                      unselectedLabelColor:
                          const Color.fromARGB(255, 108, 122, 156),
                      indicator: MaterialIndicator(
                          height: 4,
                          topLeftRadius: 8,
                          topRightRadius: 8,
                          bottomLeftRadius: 8,
                          bottomRightRadius: 8,
                          horizontalPadding: 25,
                          tabPosition: TabPosition.bottom,
                          color: const Color.fromARGB(255, 108, 122, 156)),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Info',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 530,
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 1000,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: quiltedLayout(context),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 1000,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                  ),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quiltedLayout(BuildContext context) {
    return GridView.custom(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: const [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(2, 1),
              QuiltedGridTile(2, 1),
              QuiltedGridTile(2, 1),
              QuiltedGridTile(2, 1),
            ]),
        childrenDelegate: SliverChildBuilderDelegate(((context, index) {
          index += 1;
          if (index < 12) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/placo platre/$index.jpg",
                  fit: BoxFit.cover,
                ));
          } else {
            return null;
          }
        })));
  }

  void handleFollowButton() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  const FeaturesTile({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(0xff5A6C64).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(40)),
            child: icon,
          ),
          const SizedBox(
            height: 9,
          ),
          SizedBox(
              width: 70,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5A6C64)),
              ))
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final Color _starColor = const Color.fromARGB(255, 253, 253, 253);
  const RatingBar(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: rating >= 1 ? _starColor : Colors.white60,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 2 ? _starColor : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 3 ? _starColor : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 4 ? _starColor : Colors.white30,
        ),
        const SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 5 ? _starColor : Colors.white54,
        ),
      ],
    );
  }
}

class ImageListTile extends StatelessWidget {
  final int imgUrl;
  const ImageListTile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23),
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          "assets/images/placo platre/$imgUrl.jpg",
          height: 100,
          width: 150,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
