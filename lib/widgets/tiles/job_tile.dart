import 'package:car_workshop_app/data_ops/fetching_data.dart';
import 'package:car_workshop_app/pages/job_display.dart';
import 'package:flutter/material.dart';

import '../../models/job.dart';

class JobTile extends StatefulWidget {
  const JobTile({
    super.key,
    required this.jobID,
  });

  final String jobID;

  @override
  State<JobTile> createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: getJob(widget.jobID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Job jobInfo = snapshot.data!;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobInfo(
                        jobID: jobInfo.jobID,
                      ),
                    ),
                  ).then((value) => setState(() {}));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: jobInfo.dateTimeFinished != null
                        ? Colors.green[700]
                        : Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Job ID and Vehicle Number
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job ${jobInfo.jobID}",
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(-6, 0),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "on ${jobInfo.vehicleNumber}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 51, 51, 51),
                                    ),
                                  )),
                            ),
                          ],
                        ),

                        // Time Added
                        Text(
                          jobInfo.dateTimeAdded.toString().substring(0, 10),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 51, 51, 51),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              );
            }
          }),
    );
  }
}
