// import 'package:flutter/material.dart';
//
// class UserInputBottomSheet extends StatefulWidget {
//   const UserInputBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<UserInputBottomSheet> createState() => _UserInputBottomSheetState();
// }
//
// class _UserInputBottomSheetState extends State<UserInputBottomSheet> {
//   late TextEditingController _textEditingController;
//   @override
//   void initState() {
//     _textEditingController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
//       child: Column(children: [
//         TextField(
//           controller: _textEditingController,
//           decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Enter ToDo Title',
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         InkWell(
//           onTap: () {
//             Navigator.pop(context, _textEditingController.text);
//           },
//           child: Container(
//             width: double.infinity,
//             height: 20,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
