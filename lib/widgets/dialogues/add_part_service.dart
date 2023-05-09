// import 'package:car_workshop_app/data_ops/adding_data.dart';
// import 'package:flutter/material.dart';

// class AddPartServiceDialogue extends StatefulWidget {
//   const AddPartServiceDialogue({
//     super.key,
//     required this.jobID,
//   });

//   final String jobID;

//   @override
//   State<AddPartServiceDialogue> createState() => _AddPartServiceDialogueState();
// }

// class _AddPartServiceDialogueState extends State<AddPartServiceDialogue> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController typeController = TextEditingController();
//   TextEditingController costController = TextEditingController();
//   TextEditingController supplierController = TextEditingController();
//   TextEditingController timeAddedController = TextEditingController();

//   String? PartServiceNumberError;
//   String? makeError;
//   String? modelError;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text(
//         "Add PartService",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       content: SizedBox(
//         height: 280,
//         width: 600,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 180,
//               child: GridView.count(
//                 crossAxisSpacing: 5,
//                 crossAxisCount: 2,
//                 childAspectRatio: (600 / 2) / 100,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                     child: TextField(
//                       style: TextStyle(color: Colors.grey[200]),
//                       controller: PartServiceNumberController,
//                       decoration: InputDecoration(
//                         label: const Text("PartService Number*"),
//                         errorText: PartServiceNumberError,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     child: TextField(
//                       style: TextStyle(color: Colors.grey[200]),
//                       controller: makeController,
//                       decoration: InputDecoration(
//                         label: const Text("Make*"),
//                         errorText: makeError,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     child: TextField(
//                       style: TextStyle(color: Colors.grey[200]),
//                       controller: modelController,
//                       decoration: InputDecoration(
//                         label: const Text("Model*"),
//                         errorText: modelError,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     child: TextField(
//                       style: TextStyle(color: Colors.grey[200]),
//                       controller: madeController,
//                       decoration: const InputDecoration(label: Text("Made")),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: addNewPartService,
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 100,
//                 width: 600,
//                 child: const Text(
//                   "Add New PartService",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> addNewPartService() async {
//     String PartServiceNumber = PartServiceNumberController.text;
//     String make = makeController.text;
//     String made = madeController.text;
//     String model = modelController.text;

//     showDialog(
//         context: context,
//         builder: (context) => const AlertDialog(
//               content: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ));

//     if (PartServiceNumber.isEmpty) {
//       PartServiceNumberError = "Required Field";
//     } else if (await PartServiceExistsCheck(PartServiceNumber)) {
//       PartServiceNumberError = "PartService already registered";
//     } else {
//       PartServiceNumberError = null;
//     }
//     if (make.isEmpty) {
//       makeError = "Required Field";
//     } else {
//       makeError = null;
//     }
//     if (model.isEmpty) {
//       modelError = "Required Field";
//     } else {
//       modelError = null;
//     }

//     if (PartServiceNumber.isNotEmpty &&
//         make.isNotEmpty &&
//         model.isNotEmpty &&
//         !(await PartServiceExistsCheck(PartServiceNumber))) {
//       var result = await addPartService(
//         PartServiceNumber,
//         make,
//         made,
//         model,
//         widget.customerID,
//       );
//       if (result == "SUCCESS") {
//         Navigator.pop(context);
//         Navigator.pop(context);
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("PartService added"),
//         ));
//       } else if (result == "ERROR" || result == "FAILED") {
//         Navigator.pop(context);
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text(
//               "Unknown error occoured",
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("Okay"))
//             ],
//           ),
//         );
//       } else {
//         Navigator.pop(context);
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               "Error: Status Code: $result",
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("Okay"))
//             ],
//           ),
//         );
//       }
//     } else {
//       Navigator.pop(context);
//       setState(() {});
//     }
//   }
// }
