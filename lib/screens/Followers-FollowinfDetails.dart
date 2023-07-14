import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowersFollowing extends StatefulWidget {
  const FollowersFollowing({super.key});

  @override
  State<FollowersFollowing> createState() => _FollowersFollowingState();
}

class _FollowersFollowingState extends State<FollowersFollowing>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<User> _following = <User>[
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamraj",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
  ];

  final List<User> _followers = <User>[
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile2.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile2.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile2.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile2.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile2.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
    User(
        userID: "iamkhalid",
        imagePath: "assets/images/profile1.png",
        isFollowed: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      appBar: AppBar(
        title: Text(
          "iamaswin",
          style: GoogleFonts.roboto(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF0E0B1F),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "14 Following",
              ),
              Tab(
                text: "14 Followers",
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(5.h),
            child: ListView.builder(
                itemCount: _following.length,
                itemBuilder: (BuildContext context, int index) {
                  User _user = _following[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(_user.imagePath),
                      radius: 22.5.r,
                    ),
                    title: Text(
                      _user.userID,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: (_user.isFollowed) ?
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: ElevatedButton(
                          
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF0E0B1F)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(90.w, 23.h))),
                            onPressed: () {
                              setState(() {
                                _following[index].isFollowed =
                                    !_following[index].isFollowed;
                              });
                            },
                            child: Text(
                              "Following",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                     : ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF1EA7D7)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(85.w, 23.h))),
                          onPressed: () {
                            setState(() {
                              _following[index].isFollowed =
                                  !_following[index].isFollowed;
                            });
                          },
                          child: Text(
                            "Follow",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(5.h),
            child: ListView.builder(
                itemCount: _followers.length,
                itemBuilder: (BuildContext context, int index) {
                  User _user = _followers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(_user.imagePath),
                      radius: 22.5.r,
                    ),
                    title: Text(
                      _user.userID,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: (_user.isFollowed) ?
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: ElevatedButton(
                          
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF0E0B1F)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(90.w, 23.h))),
                            onPressed: () {
                              setState(() {
                                _followers[index].isFollowed =
                                    !_followers[index].isFollowed;
                              });
                            },
                            child: Text(
                              "Following",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                     : ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF1EA7D7)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(85.w, 23.h))),
                          onPressed: () {
                            setState(() {
                              _followers[index].isFollowed =
                                  !_followers[index].isFollowed;
                            });
                          },
                          child: Text(
                            "Follow",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class User {
  String userID;
  String imagePath;
  bool isFollowed;
  User(
      {required this.userID,
      required this.imagePath,
      required this.isFollowed});
}
