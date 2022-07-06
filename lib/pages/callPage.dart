import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallPage extends StatelessWidget {
  static String id = 'call_page';
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[600],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'hey !! \nNo calls.',
                style: GoogleFonts.bebasNeue(
                  fontSize: 58,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Image.asset('asset/calll.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
