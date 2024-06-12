class GetResponseModel {
  GetResponseModel({
    required this.error,
    required this.message,
    required this.customerDetails,
    required this.instalmentsDetails,
    required this.data,
  });

  final bool? error;
  final String? message;
  final CustomerDetails? customerDetails;
  final InstalmentsDetails? instalmentsDetails;
  final List<Datum> data;

  factory GetResponseModel.fromJson(Map<String, dynamic> json){
    return GetResponseModel(
      error: json["error"],
      message: json["message"],
      customerDetails: json["customer_details"] == null ? null : CustomerDetails.fromJson(json["customer_details"]),
      instalmentsDetails: json["instalments_details"] == null ? null : InstalmentsDetails.fromJson(json["instalments_details"]),
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    required this.id,
    required this.customerId,
    required this.customerType,
    required this.amount,
    required this.depositDate,
    required this.paymentDate,
    required this.status,
    required this.crated,
    required this.updated,
  });

  final String? id;
  final String? customerId;
  final String? customerType;
  final String? amount;
  final DateTime? depositDate;
  final String? paymentDate;
  final String? status;
  final DateTime? crated;
  final DateTime? updated;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      customerId: json["customer_id"],
      customerType: json["customer_type"],
      amount: json["amount"],
      depositDate: DateTime.tryParse(json["deposit_date"] ?? ""),
      paymentDate: json["payment_date"],
      status: json["status"],
      crated: DateTime.tryParse(json["crated"] ?? ""),
      updated: DateTime.tryParse(json["updated"] ?? ""),
    );
  }

}

class InstalmentsDetails {
  InstalmentsDetails({
    required this.totalInstalments,
    required this.unpaidInstalments,
    required this.delayedInstalments,
    required this.paidInstalments,
  });

  final int? totalInstalments;
  final int? unpaidInstalments;
  final int? delayedInstalments;
  final int? paidInstalments;

  factory InstalmentsDetails.fromJson(Map<String, dynamic> json){
    return InstalmentsDetails(
      totalInstalments: json["total_instalments"],
      unpaidInstalments: json["unpaid_instalments"],
      delayedInstalments: json["delayed_instalments"],
      paidInstalments: json["paid_instalments"],
    );
  }

}
