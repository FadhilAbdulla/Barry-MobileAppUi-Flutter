import 'package:flutter/material.dart';
import '../Components/InitialPageBgContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool SentOtp = false;
  void OnLogin() {
    setState(() {
      SentOtp = !SentOtp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(left: 0, top: -2, child: InitialPageBgContainer()),
      Positioned.fill(
          child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 160),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              height: 101,
                              width: 101,
                              child:
                                  Image.asset("assets/Images/PrimeLogo.png")),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "انشاء ملف شخصي",
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: Colors.black)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 15),
                                height: 22,
                                width: 22,
                                child:
                                    Image.asset("assets/Images/WriteIcon.png"))
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "حياك الله  قم بادخال رقم الجوال  لتكمله التسويق",
                                style: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.black)),
                              ),
                              TextSpan(
                                  text: "!",
                                  style: GoogleFonts.tajawal(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Colors.black))),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextEntry(
                          hintText: "الاسم",
                        ),
                        TextEntry(
                          hintText: "البريد الالكتروني",
                        ),
                        TextEntry(
                          hintText: "العمر",
                        ),
                        TextEntry(
                          hintText: "الجنس",
                        ),
                        TextEntry(
                          hintText: "تاريخ الميلاد",
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: OnLogin,
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromRGBO(94, 58, 21, 1),
                            ),
                            child: Text(
                              "حفظ",
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ]))))
    ]));
  }
}

class TextEntry extends StatefulWidget {
  const TextEntry({super.key, required this.hintText});

  final String hintText;

  @override
  State<TextEntry> createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 19, 10, 0),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(233, 233, 233, 1).withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.77,
            child: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: widget.hintText, // Arabic hint text
                hintTextDirection: TextDirection.rtl,
                border: InputBorder.none,
              ),
              style: GoogleFonts.tajawal(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(159, 159, 159, 1))),
            ),
          ),
        ],
      ),
    );
  }
}
