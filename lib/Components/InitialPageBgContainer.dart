import 'package:flutter/material.dart';

class InitialPageBgContainer extends StatefulWidget {
  const InitialPageBgContainer({super.key});

  @override
  State<InitialPageBgContainer> createState() => _InitialPageBgContainerState();
}

class _InitialPageBgContainerState extends State<InitialPageBgContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/Images/BgDesign.png"),
    );
  }
}
