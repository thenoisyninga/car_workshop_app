import 'package:car_workshop_app/models/part_service.dart';
import 'package:flutter/material.dart';

class PartServiceDisplayDialogue extends StatefulWidget {
  const PartServiceDisplayDialogue({super.key, required this.partService});

  @override
  State<PartServiceDisplayDialogue> createState() =>
      _PartServiceDisplayDialogueState();

  final PartService partService;
}

class _PartServiceDisplayDialogueState
    extends State<PartServiceDisplayDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Column(
          children: [
            Text(
              widget.partService.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              widget.partService.type,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
        content: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Supplier: "),
                  Text(
                    widget.partService.supplier == null ||
                            widget.partService.supplier == ""
                        ? "-"
                        : widget.partService.supplier!,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Cost: "),
                  Text(widget.partService.cost.toString())
                ],
              ),
              const Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: ListView(children: [
                  Text(
                      widget.partService.details ?? "")
                ]),
              )
            ],
          ),
        ));
  }
}
