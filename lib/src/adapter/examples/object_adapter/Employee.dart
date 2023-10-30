class Employee {
  String? fullName;
  String? jobTitle;
  String? officeLocation;

  String? getFullName(){
    return fullName;
  }

  String? getJobTitle(){
    return jobTitle;
  }

  String? getOfficeLocation(){
    return officeLocation;
  }

  void setFullName(String? fullName){
    this.fullName = fullName;
  }

  void setJobTitle(String? jobTitle){
    this.jobTitle = jobTitle;
  }

  void setOfficeLocation(String? officeLocation){
    this.officeLocation = officeLocation;
  }

}