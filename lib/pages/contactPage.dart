import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  static String id = 'contact_page';
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[600],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'hey !! \nU didnt\' updated your Contacts  Yet.',
                style: GoogleFonts.bebasNeue(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'asset/contact.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
