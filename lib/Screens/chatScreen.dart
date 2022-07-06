import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_chat/helpers.dart';
import 'package:ui_chat/widgits/avatar.dart';
import 'package:ui_chat/widgits/glowing_button.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'chat_Screen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.black,
          leading: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Avatar.small(url: Helper.randomPicUrl()),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faker.person.name(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[400],
                ),
              ),
              Text(
                'Online now',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                  child: Icon(
                    Icons.video_call,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                  child: Icon(
                    Icons.call,
                    size: 20,
                  ),
                ),
              ]),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: MessageBox(),
            ),
            ActionBar(),
          ],
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black87,
      child: ListView(
        children: [
          Center(
            child: LabelCard(
              label: 'Yesterday',
            ),
          ),
          SenderMessages(
            message: 'Hey ! how are u?',
            messageDate: '12:00',
          ),
          SenderOwnMessages(
            message: 'hello, i am good',
            messageDate: '12:01',
          ),
          SenderMessages(
            message: 'I like ur ui design',
            messageDate: '12:00',
          ),
          SenderOwnMessages(
            message: 'thanks',
            messageDate: '12:01',
          ),
          SenderMessages(
            message: 'is this a demo ui......',
            messageDate: '12:02',
          ),
          SenderOwnMessages(
            message: 'yess...this is ui for chat',
            messageDate: '12:02',
          ),
          SenderMessages(
            message: 'Ohh that\'s great',
            messageDate: '12:02',
          ),
          SenderOwnMessages(
            message: 'yipps ',
            messageDate: '12:03',
          ),
          SenderMessages(
            message: 'Ok see u later',
            messageDate: '12:04',
          ),
          SenderOwnMessages(
            message: 'yoo',
            messageDate: '12:04',
          ),
          SenderMessages(
            message: 'byee',
            messageDate: '12:04',
          ),
          SenderOwnMessages(
            message: 'bye',
            messageDate: '12:04',
          ),
        ],
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 2, color: Colors.grey),
              ),
            ),
            child: const Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.camera_alt_sharp,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Type something',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GlowingButton(
                size: 45,
                icon: Icons.send,
                colour: Colors.deepOrange,
                onPressed: () => print('done')),
          )
        ],
      ),
    );
  }
}

class LabelCard extends StatelessWidget {
  LabelCard({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SenderMessages extends StatelessWidget {
  SenderMessages({required this.message, required this.messageDate});
  String message;
  String messageDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            messageDate,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SenderOwnMessages extends StatelessWidget {
  SenderOwnMessages({required this.message, required this.messageDate});
  String message;
  String messageDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
                bottomLeft: Radius.circular(26),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            messageDate,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
