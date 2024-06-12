class LoginResponseModel {
  LoginResponseModel({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool? error;
  final String? message;
  final Data? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(
      error: json["error"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.customerId,
    required this.mobile,
    required this.password,
    required this.userType,
    required this.created,
    required this.updated,
    required this.customerDetails,
  });

  final String? id;
  final String? customerId;
  final String? mobile;
  final String? password;
  final String? userType;
  final DateTime? created;
  final DateTime? updated;
  final CustomerDetails? customerDetails;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      customerId: json["customer_id"],
      mobile: json["mobile"],
      password: json["password"],
      userType: json["user_type"],
      created: DateTime.tryParse(json["created"] ?? ""),
      updated: DateTime.tryParse(json["updated"] ?? ""),
      customerDetails: json["customer_details"] == null ? null : CustomerDetails.fromJson(json["customer_details"]),
    );
  }

}

class CustomerDetails {
  CustomerDetails({
    required this.buyerId,
    required this.jewellerId,
    required this.name,
    required this.mobile,
    required this.whatsapNo,
    required this.emailId,
    required this.address,
    required this.productType,
    required this.productName,
    required this.productImg,
    required this.buyerImg,
    required this.productPrice,
    required this.interestType,
    required this.interest,
    required this.instalmentCount,
    required this.instalment,
    required this.instalmentDate,
    required this.depositedAmount,
    required this.notification,
    required this.status,
    required this.created,
    required this.updated,
  });

  final String? buyerId;
  final String? jewellerId;
  final String? name;
  final String? mobile;
  final String? whatsapNo;
  final String? emailId;
  final String? address;
  final String? productType;
  final String? productName;
  final String? productImg;
  final String? buyerImg;
  final String? productPrice;
  final String? interestType;
  final String? interest;
  final String? instalmentCount;
  final String? instalment;
  final DateTime? instalmentDate;
  final String? depositedAmount;
  final String? notification;
  final String? status;
  final String? created;
  final DateTime? updated;

  factory CustomerDetails.fromJson(Map<String, dynamic> json){
    return CustomerDetails(
      buyerId: json["buyer_id"],
      jewellerId: json["jeweller_id"],
      name: json["name"],
      mobile: json["mobile"],
      whatsapNo: json["whatsap_no"],
      emailId: json["email_id"],
      address: json["address"],
      productType: json["product_type"],
      productName: json["product_name"],
      productImg: json["product_img"],
      buyerImg: json["buyer_img"],
      productPrice: json["product_price"],
      interestType: json["interest_type"],
      interest: json["interest"],
      instalmentCount: json["instalment_count"],
      instalment: json["instalment"],
      instalmentDate: DateTime.tryParse(json["instalment_date"] ?? ""),
      depositedAmount: json["deposited_amount"],
      notification: json["notification"],
      status: json["status"],
      created: json["created"],
      updated: DateTime.tryParse(json["updated"] ?? ""),
    );
  }

}
