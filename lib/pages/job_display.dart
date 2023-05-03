import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../widgets/job_tile.dart';

class JobInfo extends StatefulWidget {
  const JobInfo({
    super.key,
    required this.jobID
  });

  final String jobID;

  @override
  State<JobInfo> createState() => _JobInfoState();
}

class _JobInfoState extends State<JobInfo> {

  final String customerComplaint = "csileceubciernhebrfberfb erhfvwevfwbefhverfweruifvwyegceowercniorncowrncwnrcuwrnivenvnervneronhruifneurnvuioereoinioernioernvioenvioernvioenriovnkdnsjner";
  final String workDetails = "csileceubciernhebrfberfb erhfvwevfwbefhverfweruifvwyegceowercniorncowrncwnrcuwrnivenvnervneronhruifneurnvuioereoinioernioernvioenvioernvioenriovnkdnsjner";
  final double cost = 0;
  final double price = 1000;
  final double paid = 1000;
  final String vehicleNumber= "AGD423";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Vehicle Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "$model, $make",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      made ?? "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
                child: Container(
              // color: Colors.black,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Text(
                        "Jobs on this vehicle",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView(
                        children: const [
                          JobTile(jobID: "1"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
