class Vendor {
  String? name;
  String? companyName;
  String? companyAddress;

  String? getName(){
    return name;
  }

  String? getCompanyName(){
    return companyName;
  }

  String? getCompanyAddress(){
    return companyAddress;
  }

  void setName(String? name){
    this.name = name;
  }

  void setCompanyName(String? companyName){
    this.companyName = companyName;
  }

  void setCompanyAddress(String? companyAddress){
    this.companyAddress = companyAddress;
  }

}