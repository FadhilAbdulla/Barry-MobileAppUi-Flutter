import 'package:flutter/material.dart';
import '../Components/InitialPageBgContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool SentOtp = false;

  void OtpSent() {
    setState(() {
      SentOtp = !SentOtp;
    });
    ShowOtpSentMessage();
  }

  void ShowOtpSentMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: FullWidthDialogContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
                        child: Image.asset("assets/Images/PrimeLogo.png")),
                  ),
                  SizedBox(
                    height: SentOtp ? 35 : 45,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        SentOtp ? "كود التفعيل " : "تسجيل الدخول",
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
                          child: Image.asset(
                              "assets/Images/${SentOtp ? "WriteIcon" : "ClapIcon"}.png"))
                    ],
                  ),
                  SizedBox(
                    height: 3,
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
                    height: SentOtp ? 20 : 32,
                  ),
                  SentOtp
                      ? OtpEntry()
                      : Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(233, 233, 233, 1)
                                    .withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropDown(),
                              VerticalDivider(
                                color: Color.fromRGBO(223, 223, 223, 1),
                                width: 10,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.53,
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  decoration: InputDecoration(
                                    hintText: 'رقم الجوال', // Arabic hint text
                                    hintTextDirection: TextDirection.rtl,
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.tajawal(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                              159, 159, 159, 1))),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: SentOtp ? 20 : 50,
                  ),
                  GestureDetector(
                    onTap: OtpSent,
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
                        SentOtp ? "تاكيد" : "دخول",
                        style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _selectedProject = "966";
  List<String> ListItem = ["966", "971", "91"];
  Map FlagCountry = {
    "966": "SaudiFlag.png",
    "971": "SaudiFlag.png",
    "91": "SaudiFlag.png"
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.210,
      height: MediaQuery.of(context).size.height * 0.04,
      // color: Colors.amberAccent,
      child: DropdownButton<String>(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Color.fromRGBO(131, 68, 5, 1),
        ), // Custom arrow icon
        iconSize: 24, // Size of the icon
        underline: SizedBox(), // Removes the default underline
        value: _selectedProject,
        // hint: Text("Select a project",st),
        onChanged: (String? newProject) {
          setState(() {
            _selectedProject = newProject;
          });
        },
        items: ListItem.map((String project) {
          return DropdownMenuItem<String>(
            value: project,
            alignment: Alignment.centerLeft,
            child: Container(
              child: Row(
                children: [
                  Text(
                    "(+${project})",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Image.asset(
                    "assets/Images/${FlagCountry[_selectedProject]}",
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return ListItem.map<Widget>((String project) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(+${project})",
                    style: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  Image.asset(
                    "assets/Images/${FlagCountry[project]}",
                    height: 18,
                    width: 18,
                  )
                ],
              ),
            );
          }).toList();
        },
      ),
    );
  }
}

class OtpEntry extends StatefulWidget {
  @override
  _OtpEntryState createState() => _OtpEntryState();
}

class _OtpEntryState extends State<OtpEntry> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  int _remainingTime = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Container(
              alignment: Alignment.center,
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: Colors.white),
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color.fromRGBO(147, 147, 147, 1))),
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (index + 1 < _focusNodes.length) {
                      FocusScope.of(context)
                          .requestFocus(_focusNodes[index + 1]);
                    } else {
                      _focusNodes[index]
                          .unfocus(); // Unfocus if it's the last TextField
                    }
                  }
                },
              ),
            );
          }),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "ستنتهي صلاحية الكود خلال",
                style: GoogleFonts.tajawal(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black)),
              ),
              TextSpan(
                  text: " $_remainingTime:00 ",
                  style: GoogleFonts.tajawal(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color.fromRGBO(131, 68, 5, 1)))),
              TextSpan(
                text: "ثانية",
                style: GoogleFonts.tajawal(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black)),
              ),
            ],
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}

class FullWidthDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            ),
          ),
          const Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 55, 55, 55),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
