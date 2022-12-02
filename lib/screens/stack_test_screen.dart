import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class StackTestScreen extends StatefulWidget {
  const StackTestScreen({Key? key}) : super(key: key);

  @override
  State<StackTestScreen> createState() => _StackTestScreenState();
}

class _StackTestScreenState extends State<StackTestScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    // var screenWidth=size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Blur(
              blur: 3,
               colorOpacity: .3,
              blurColor: Colors.black,
              child: Container(width: size.width,
              height: 175,
              child: Image.asset("assets/pngs/food.png",fit: BoxFit.fill,)
              ),
            ),
            SvgPicture.asset("assets/svgs/whatsapp.svg",color: Colors.white,),

            Text("dfwdfwf",style: GoogleFonts.abel(
              color: Colors.white,

            ),)
          ],
        ),
      ),
    );
  }
}
