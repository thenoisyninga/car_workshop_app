class PartService {
  String name;
  String type;
  double cost;
  String? supplier;
  String jobID;
  DateTime timeAdded;
  String? details;

  PartService(
    this.name,
    this.type,
    this.cost,
    this.supplier,
    this.jobID,
    this.timeAdded,
    this.details,
  );
}
