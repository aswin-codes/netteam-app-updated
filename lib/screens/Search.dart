import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _inputController = TextEditingController();
  final List<User> _availableUser = [
    User(
        userId: 'iamaswin',
        userName: "Aswin Raaj",
        imagePath: "assets/images/profile1.png",
        isLive: false),
    User(
        userId: 'iamjulie',
        userName: "Julie Jason",
        imagePath: "assets/images/profile2.png",
        isLive: true),
    User(
        userId: 'iamxyz',
        userName: "Kevin Paul",
        imagePath: "assets/images/profile3.png",
        isLive: false),
    User(
        userId: 'iamjake',
        userName: "Jake",
        imagePath: "assets/images/profile4.png",
        isLive: false),
    User(
        userId: 'iamjason',
        userName: "Jason",
        imagePath: "assets/images/profile5.png",
        isLive: false),
    User(
        userId: 'iamchris',
        userName: "Chris Hemsworth",
        imagePath: "assets/images/profile6.png",
        isLive: false),
  ];

  List<User> _userList = [];

  void searchUsers(String query) {
    setState(() {
      _userList = _availableUser.where((user) {
        return user.userName.toLowerCase().contains(query.toLowerCase()) ||
            user.userId.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void getRandomUsers() {
    List<User> _randomUsers = [];
    Random random = Random();
    while (_randomUsers.length < 5) {
      int randomIndex = random.nextInt(_availableUser.length);
      User element = _availableUser[randomIndex];
      if (!_randomUsers.contains(element)) {
        _randomUsers.add(element);
      }
    }
    setState(() {
      _userList = _randomUsers;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getRandomUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48.h,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextField(
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          controller: _inputController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            contentPadding: EdgeInsets.all(10),
                            fillColor: const Color(0xFF343750),
                            filled: true,
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          onChanged: (_) {
                            searchUsers(_);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = _userList[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      leading: user.isLive
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 5,
                                  color: const Color(0xFF1EA7D7),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 27,
                                backgroundImage: AssetImage(user.imagePath),
                              ),
                            )
                          : CircleAvatar(
                              radius: 33,
                              backgroundImage: AssetImage(user.imagePath),
                            ),
                      title: Text(
                        user.userId,
                        style: GoogleFonts.poppins(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        user.userName,
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  String userId; //id refers to the user id. For Ex, @iamaswin
  String
      userName; //userName refers to full name of the user. For Ex, Aswin Raaj
  String imagePath; //imagePath refers to the url of the network image
  bool isLive; //isLive should be true, if the user is in live
  User(
      {required this.userId,
      required this.userName,
      required this.imagePath,
      required this.isLive});
}
