import 'package:car_workshop_app/models/part_service.dart';
import 'package:flutter/material.dart';

class PartServiceTile extends StatelessWidget {
  const PartServiceTile({
    super.key,
    required this.partService,
    required this.deletePartServiceCallback,
  });

  final PartService partService;
  final Function(String, String) deletePartServiceCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partService.name,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  partService.type,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Text(partService.supplier != null
                ? "Supplied by ${partService.supplier}"
                : ""),
            Row(
              children: [
                Text("Rs.${partService.cost}"),
                IconButton(
                    onPressed: () async {
                      await deletePartServiceCallback(
                        partService.name, partService.jobID);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
