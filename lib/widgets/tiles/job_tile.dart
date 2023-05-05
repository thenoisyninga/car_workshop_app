import 'package:car_workshop_app/pages/customer_display.dart';
import 'package:car_workshop_app/pages/job_display.dart';
import 'package:flutter/material.dart';

import '../../models/job.dart';
import '../../pages/vehicle_display.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    super.key,
    required this.jobInfo,
  });

  final Job jobInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobInfo(
                jobID: jobInfo.jobID,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
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
                          fontSize: 19, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
