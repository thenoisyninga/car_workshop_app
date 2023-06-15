import 'package:car_workshop_app/models/part_service.dart';
import 'package:car_workshop_app/widgets/dialogues/part_service_display.dart';
import 'package:car_workshop_app/widgets/dialogues/update_part_service.dart';
import 'package:flutter/material.dart';

class PartServiceTile extends StatefulWidget {
  const PartServiceTile({
    super.key,
    required this.partService,
    required this.deletePartServiceCallback,
    required this.setStateCallback,
    required this.index,
  });
  final int index;
  final PartService partService;
  final Function(String, String) deletePartServiceCallback;
  final Function setStateCallback;

  @override
  State<PartServiceTile> createState() => _PartServiceTileState();
}

class _PartServiceTileState extends State<PartServiceTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => PartServiceDisplayDialogue(
          partService: widget.partService,
        ),
      ).then((value) => setState(() {})),
      child: Container(
        height: 60,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Row(
                  children: [
                    // index
                    Text("${widget.index}."),
                    const SizedBox(width: 20),

                    // Name and Type
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.partService.name,
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(
                          widget.partService.type,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Detail
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Text(widget.partService.details ?? ""),
              ),

              // Supplier
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Text(
                  widget.partService.supplier != null
                      ? widget.partService.supplier!.isNotEmpty
                          ? "Supplied by ${widget.partService.supplier}"
                          : "No Supplier"
                      : "",
                ),
              ),

              // Quantity
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Text(widget.partService.quantity.toString()),
              ),
              // Status
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Text(widget.partService.status ?? ""),
              ),
              // Cost
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Text("Rs.${widget.partService.cost}"),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 8 - 16) / 8,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => UpdatePartServiceDialogue(
                            partService: widget.partService,
                          ),
                        ).then((value) {
                          widget.setStateCallback();
                        });
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Are you sure you want to delete this ${widget.partService.type}?",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          await widget
                                              .deletePartServiceCallback(
                                            widget.partService.name,
                                            widget.partService.jobID,
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No"))
                                    ],
                                  ));
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
