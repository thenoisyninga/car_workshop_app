import 'package:car_workshop_app/data_ops/fetching_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/job.dart';
import '../widgets/tiles/job_tile.dart';

class RecentJobs extends StatefulWidget {
  const RecentJobs({super.key});

  @override
  State<RecentJobs> createState() => _RecentJobsState();
}

class _RecentJobsState extends State<RecentJobs> {
  String completedFilter = "ALL";
  String paidFilter = "ALL";
  int resultLimit = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Recent Jobs",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "FILTERS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Completed Filter Selection
                Column(
                  children: [
                    const Text(
                      "COMPLETION",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      iconEnabledColor: Theme.of(context).colorScheme.primary,
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(10),
                      value: completedFilter,
                      items: const [
                        DropdownMenuItem(
                          value: "COMPLETED",
                          child: Text("Completed"),
                        ),
                        DropdownMenuItem(
                          value: "NOT COMPLETED",
                          child: Text("Incomplete"),
                        ),
                        DropdownMenuItem(
                          value: "ALL",
                          child: Text("All"),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) {
                            completedFilter = value;
                          }
                        });
                      },
                    ),
                  ],
                ),

                // Payment Filter Selection
                Column(
                  children: [
                    const Text(
                      "PAYMENT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      iconEnabledColor: Theme.of(context).colorScheme.primary,
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(10),
                      value: paidFilter,
                      items: const [
                        DropdownMenuItem(
                          value: "PAID",
                          child: Text("Paid"),
                        ),
                        DropdownMenuItem(
                          value: "NOT PAID",
                          child: Text("Not Paid"),
                        ),
                        DropdownMenuItem(
                          value: "ALL",
                          child: Text("All"),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          if (value != null) {
                            paidFilter = value;
                          }
                        });
                      },
                    ),
                  ],
                ),

                // Limit Selection
                Column(
                  children: [
                    const Text(
                      "LIMIT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      iconEnabledColor: Theme.of(context).colorScheme.primary,
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(10),
                      value: resultLimit,
                      items: const [
                        DropdownMenuItem(
                          value: 25,
                          child: Text("25"),
                        ),
                        DropdownMenuItem(
                          value: 50,
                          child: Text("50"),
                        ),
                        DropdownMenuItem(
                          value: 75,
                          child: Text("75"),
                        ),
                        DropdownMenuItem(
                          value: 100,
                          child: Text("100"),
                        ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          if (value != null) {
                            resultLimit = value;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: FutureBuilder(
                  future:
                      getRecentJobs(completedFilter, paidFilter, resultLimit),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Job> searchResults = snapshot.data!;
                      return ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: ((context, index) {
                            return JobTile(
                              jobInfo: searchResults[index],
                            );
                          }));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
