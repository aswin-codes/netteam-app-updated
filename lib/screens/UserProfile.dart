import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netteam/screens/Search.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User _user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF0E0B1F),
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20.h,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        automaticallyImplyLeading: false,
        title: Text(
          _user.userName,
          style: GoogleFonts.roboto(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 20.h,
              ))
        ],
      ),
      body: Body(
        user: _user,
      ),
      backgroundColor: const Color(0xFF0E0B1F),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Color(0xFF0E0B1F),
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.home,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to Home
                  Navigator.pushNamed(context, "/");
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.videocam_rounded,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to Video Call
                  Navigator.pushNamed(context, "/videoset");
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.add_circle_rounded,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to Add tiktok
                  Navigator.pushNamed(context, "/create");
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.chat_bubble,
                        size: 30.h, color: const Color(0xFFFFFFFF))),
                onTap: () {
                  //Navigate to chat
                  Navigator.pushNamed(context, "/chatlist");
                },
              ),
              GestureDetector(
                child: SizedBox(
                    height: 40.h,
                    child: Icon(Icons.account_circle,
                        size: 30.h, color: const Color(0xFF1EA7D7))),
                onTap: () {
                  //Navigate to Account section
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  User user;
  Body({Key? key, required this.user}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFollowing = true;
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.user.isLive) {
                      Navigator.pushNamed(context, '/viewerslive');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: (widget.user.isLive)
                            ? Border.all(
                                width: 5.0, color: const Color(0xFF1EA7D7))
                            : Border.all()),
                    child: CircleAvatar(
                        radius: 48.r,
                        backgroundImage: AssetImage(widget.user.imagePath)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  widget.user.userId,
                  style: GoogleFonts.roboto(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "14",
                          style: GoogleFonts.roboto(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Following",
                          style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "38",
                          style: GoogleFonts.roboto(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Followers",
                          style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Text(
                          "91",
                          style: GoogleFonts.roboto(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Posts",
                          style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: (isFollowing)
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(color: Colors.white, width: 1))
                          : BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                            ),
                      height: 36.h,
                      width: 125.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          isFollowing ? "Following" : "Follow",
                          style: (isFollowing)
                              ? GoogleFonts.poppins(color: Colors.white)
                              : GoogleFonts.poppins(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                          print(isFollowing);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(color: Colors.white, width: 1)),
                      height: 36.h,
                      width: 125.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text("Message"),
                        onPressed: () {
                          //Navigate to chat screen
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 40.h,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Color(0xFFD0D1D3), width: 1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  (pageIndex == 0)
                      ? "assets/icons/posts_white.png"
                      : "assets/icons/posts_grey.png",
                  height: 15.h,
                  width: 15.h,
                ),
                Image.asset(
                  (pageIndex == 1)
                      ? "assets/icons/private_white.png"
                      : "assets/icons/private_grey.png",
                  height: 20.h,
                  width: 20.h,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.maxFinite,
            height: double.maxFinite,
            child: PageView(
                onPageChanged: (i) {
                  setState(() {
                    pageIndex = i;
                  });
                },
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      scrollDirection: Axis.vertical,
                      children: List.generate(9, (index) {
                        return AspectRatio(
                          aspectRatio: 5 / 3,
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Content ${index + 1}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      shrinkWrap: true,
                      children: List.generate(9, (index) {
                        return Container(
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              'Content ${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    ));
  }
}