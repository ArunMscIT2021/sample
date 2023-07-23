// import 'package:flutter/material.dart';
//
// import '../../widgets/chat_container.dart';
// import '../../widgets/chat_custom_textformfield.dart';
// import '../../widgets/message_card.dart';
// import '../../widgets/reusable_app_bar.dart';
//
// class Messages extends StatefulWidget {
//   const Messages({Key? key}) : super(key: key);
//
//   @override
//   State<Messages> createState() => _MessagesState();
// }
//
// class _MessagesState extends State<Messages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(80.0),
//         child: ReusableAppBar(title: 'Message'),
//       ),
//       body: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10),
//         child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.all(0.0),
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: MessageCard(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const ChatScreen()));
//                     },
//                     userName: 'Maddy',
//                     userMessage: 'call me urgent!',
//                     lastTime: '7.36 pm',
//                     countMgs: '8',
//                   ),
//                 ),
//                 const Divider()
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back),
//         ),
//         title: Row(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 margin: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     width: 1,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 height: 40,
//                 width: 40,
//                 child: const CircleAvatar(
//                   backgroundImage: AssetImage("assets/images/image.jpg"),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Maddy",
//                   style: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   "last seen recently",
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w300,
//                       fontStyle: FontStyle.italic),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
//           IconButton(
//               onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.all(0.0),
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return const Column(
//               children: [
//                 ChatContainer(
//                     text: 'How was the concert?', isCurrentUser: false),
//                 ChatContainer(
//                     text: 'Awesome! Next time you gotta come as well!',
//                     isCurrentUser: true),
//                 ChatContainer(
//                     text: 'Ok, when is the next date?', isCurrentUser: false),
//                 ChatContainer(
//                     text: 'They\'re playing on the 20th of November',
//                     isCurrentUser: true),
//                 ChatContainer(text: 'Let\'s do it!', isCurrentUser: false),
//                 ChatContainer(
//                     text: 'sorry i cont understand can you send voice message',
//                     isCurrentUser: true),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: const ChatCustomTextFormField(),
//     );
//   }
// }
