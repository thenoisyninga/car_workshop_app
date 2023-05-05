class Job {
  String jobID;
  String customerComplaint;
  String? workDetails;
  double cost;
  double price;
  double paid;
  String vehicleNumber;
  DateTime dateTimeAdded;
  DateTime? dateTimeFinished;
  double kilometers;

  Job(
    this.jobID,
    this.customerComplaint,
    this.workDetails,
    this.cost,
    this.price,
    this.paid,
    this.vehicleNumber,
    this.dateTimeAdded,
    this.dateTimeFinished,
    this.kilometers,
  );
}
