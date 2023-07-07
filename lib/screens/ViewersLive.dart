import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netteam/screens/Live.dart';

class ViewersLive extends StatefulWidget {
  const ViewersLive({super.key});

  @override
  State<ViewersLive> createState() => _ViewersLiveState();
}

class _ViewersLiveState extends State<ViewersLive> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLiked = false;

  final List<LiveChat> _chatList = <LiveChat>[
    LiveChat(
        userName: "iamraj",
        imageUrl: "assets/images/profile1.png",
        chat: "Hi bro"),
    LiveChat(
        userName: "iamkumar",
        imageUrl: "assets/images/profile2.png",
        chat: "Hi, Love from India"),
    LiveChat(
        userName: "iamresin",
        imageUrl: "assets/images/profile3.png",
        chat: "Hi bro, Love from Sydney")
  ];

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void addText() {
    if (_textEditingController.text != '') {
      setState(() {
        _chatList.add(LiveChat(
            userName: "iamaswin",
            imageUrl: "assets/images/profile4.png",
            chat: _textEditingController.text));
      });
      _textEditingController.text = '';
      FocusScope.of(context).unfocus();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Should be later converted to live video part
          SizedBox(
            height: MediaQuery.of(context)!.size.height,
            width: MediaQuery.of(context)!.size.width,
            child: Image.asset(
              'assets/images/liveSample.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10)
                      ]),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 17,
                            backgroundImage:
                                AssetImage('assets/images/profile1.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "iamjulie",
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 32.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              color: Color(0xFF1EA7D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Text(
                              "Live",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 32.h,
                          width: 60.w,
                          decoration: const BoxDecoration(
                              color: Colors.black26,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.visibility_rounded,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Live",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10)
                            ]),
                            child: const Icon(
                              Icons.close_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20
                      )
                    ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200.h,
                            width: 290.w,
                            child: ListView.builder(
                                controller: _scrollController,
                                itemCount: _chatList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  LiveChat chat = _chatList[index];
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 25.r,
                                      backgroundImage: AssetImage(chat.imageUrl),
                                    ),
                                    title: Text(
                                      chat.userName,
                                      style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    subtitle: Text(
                                      chat.chat,
                                      style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            height: 40.h,
                            width: 290.w,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                border: Border.all(color: Colors.white)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextField(
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.none,
                                    controller: _textEditingController,
                                    onSubmitted: (val) {
                                      addText();
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        hintText: 'Type a Message',
                                        hintStyle: GoogleFonts.roboto(
                                            fontSize: 15.sp,
                                            color: const Color(0xFFB6B7B8),
                                            fontWeight: FontWeight.bold),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(0, 0, 0, 0)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                VerticalDivider(
                                  color: const Color(0xFFB6B7B8),
                                  width: 1.h,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      addText();
                                    },
                                    icon: Icon(
                                      Icons.send_outlined,
                                      size: 20.h,
                                      color: const Color(0xFF491BBA),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              icon: Icon(
                                  isLiked
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: Colors.white,
                                  size: 40.h)),
                          GestureDetector(
                            child: Image.asset(
                              "assets/icons/superChat.png",
                              height: 50.h,
                              width: 50.h,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
