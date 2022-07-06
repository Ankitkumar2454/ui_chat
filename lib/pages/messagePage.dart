import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ui_chat/Screens/chatScreen.dart';
import 'package:ui_chat/helpers.dart';
import 'package:ui_chat/widgits/avatar.dart';
import '../modals/messageData.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // color: Theme.of(context).cardColor,
          child: SizedBox(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Stories',
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                //storyRow
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 60,
                    itemBuilder: ((context, index) {
                      final faker = Faker();
                      return StoryViewer(
                        name: faker.person.firstName(),
                        url: Helper.randomPicUrl(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Card(
            // color: Colors.grey[350],
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) {
                final faker = Faker();
                final date = Helper.randomDate();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      // color: Colors.grey[100],
                      child: SizedBox(
                        height: 100,
                        child: MessageTile(
                          messages: MessageData(
                            name: faker.person.name(),
                            message: faker.lorem.sentence(),
                            messageDate: date,
                            dateMessage: Jiffy(date).fromNow(),
                            profilePhoto: Helper.randomPicUrl(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        )
      ],
    );
  }
}

//there is a class named MessageData in models folder

class MessageTile extends StatelessWidget {
  MessageTile({required this.messages});
  final MessageData messages;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ChatScreen.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Avatar.large(
              url: messages.profilePhoto,
            ),
            title: Text(
              messages.name,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                messages.message,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${messages.dateMessage}',
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                      letterSpacing: -0.1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Center(
                    child: Text("1"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryViewer extends StatelessWidget {
  String name;
  String url;
  StoryViewer({required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Avatar.medium(url: url),
          SizedBox(
            height: 6,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
