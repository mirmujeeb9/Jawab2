// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  //dynamic coingateSubscriberId;
  //dynamic teamId;
  //dynamic teamManagerId;
  String name;
  //String surname;
  String email;
  dynamic phone;
  //String type;
  dynamic avatar;
  dynamic companyName;
  dynamic companyWebsite;
  dynamic country;
  dynamic address;
  dynamic postal;
  //int status;
  //int remainingWords;
  //int remainingImages;
  dynamic lastSeen;
  dynamic githubId;
  dynamic githubToken;
  dynamic googleId;
  dynamic googleToken;
  dynamic facebookId;
  dynamic facebookToken;
  dynamic twitterId;
  dynamic twitterToken;
  //DateTime createdAt;
  //DateTime updatedAt;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  //String affiliateCode;
  //String affiliateEarnings;
  dynamic affiliateBankAccount;
  dynamic affiliateId;
  //String emailConfirmationCode;
  //int emailConfirmed;
  dynamic passwordResetCode;
  dynamic githubRefreshToken;
  dynamic googleRefreshToken;
  dynamic iyzicoId;
  //String revenuecatId;
  dynamic appleId;
  dynamic appleToken;
  dynamic appleRefreshToken;
  dynamic razorpayId;

  UserModel({
    required this.id,
    //required this.coingateSubscriberId,
    //required this.teamId,
    //required this.teamManagerId,
    required this.name,
    //required this.surname,
    required this.email,
    required this.phone,
    //required this.type,
    this.avatar,
    required this.companyName,
    required this.companyWebsite,
    required this.country,
    required this.address,
    required this.postal,
    //required this.status,
    //required this.remainingWords,
    //required this.remainingImages,
    required this.lastSeen,
    required this.githubId,
    required this.githubToken,
    required this.googleId,
    required this.googleToken,
    required this.facebookId,
    required this.facebookToken,
    required this.twitterId,
    required this.twitterToken,
    //required this.createdAt,
    //required this.updatedAt,
    required this.stripeId,
    required this.pmType,
    required this.pmLastFour,
    required this.trialEndsAt,
    //required this.affiliateCode,
    //required this.affiliateEarnings,
    required this.affiliateBankAccount,
    required this.affiliateId,
    //required this.emailConfirmationCode,
    //required this.emailConfirmed,
    required this.passwordResetCode,
    required this.githubRefreshToken,
    required this.googleRefreshToken,
    required this.iyzicoId,
    //required this.revenuecatId,
    required this.appleId,
    required this.appleToken,
    required this.appleRefreshToken,
    required this.razorpayId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        //coingateSubscriberId: json["coingate_subscriber_id"],
        //teamId: json["team_id"],
        //teamManagerId: json["team_manager_id"],
        name: json["name"],
        //surname: json["surname"],
        email: json["email"],
        phone: json["phone"],
        //type: json["type"],
        avatar: json["avatar"],
        companyName: json["company_name"],
        companyWebsite: json["company_website"],
        country: json["country"],
        address: json["address"],
        postal: json["postal"],
        //status: json["status"],
        //remainingWords: json["remaining_words"],
        //remainingImages: json["remaining_images"],
        lastSeen: json["last_seen"],
        githubId: json["github_id"],
        githubToken: json["github_token"],
        googleId: json["google_id"],
        googleToken: json["google_token"],
        facebookId: json["facebook_id"],
        facebookToken: json["facebook_token"],
        twitterId: json["twitter_id"],
        twitterToken: json["twitter_token"],
        //createdAt: DateTime.parse(json["created_at"]),
        //updatedAt: DateTime.parse(json["updated_at"]),
        stripeId: json["stripe_id"],
        pmType: json["pm_type"],
        pmLastFour: json["pm_last_four"],
        trialEndsAt: json["trial_ends_at"],
        //affiliateCode: json["affiliate_code"],
        //affiliateEarnings: json["affiliate_earnings"],
        affiliateBankAccount: json["affiliate_bank_account"],
        affiliateId: json["affiliate_id"],
        //emailConfirmationCode: json["email_confirmation_code"],
        //emailConfirmed: json["email_confirmed"],
        passwordResetCode: json["password_reset_code"],
        githubRefreshToken: json["github_refresh_token"],
        googleRefreshToken: json["google_refresh_token"],
        iyzicoId: json["iyzico_id"],
        //revenuecatId: json["revenuecat_id"],
        appleId: json["apple_id"],
        appleToken: json["apple_token"],
        appleRefreshToken: json["apple_refresh_token"],
        razorpayId: json["razorpay_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        //"coingate_subscriber_id": coingateSubscriberId,
        //"team_id": teamId,
        //"team_manager_id": teamManagerId,
        "name": name,
        //"surname": surname,
        "email": email,
        "phone": phone,
        //"type": type,
        "avatar": avatar,
        "company_name": companyName,
        "company_website": companyWebsite,
        "country": country,
        "address": address,
        "postal": postal,
        //"status": status,
        //"remaining_words": remainingWords,
        //"remaining_images": remainingImages,
        "last_seen": lastSeen,
        "github_id": githubId,
        "github_token": githubToken,
        "google_id": googleId,
        "google_token": googleToken,
        "facebook_id": facebookId,
        "facebook_token": facebookToken,
        "twitter_id": twitterId,
        "twitter_token": twitterToken,
        //"created_at": createdAt.toIso8601String(),
        //"updated_at": updatedAt.toIso8601String(),
        "stripe_id": stripeId,
        "pm_type": pmType,
        "pm_last_four": pmLastFour,
        "trial_ends_at": trialEndsAt,
        //"affiliate_code": affiliateCode,
        //"affiliate_earnings": affiliateEarnings,
        "affiliate_bank_account": affiliateBankAccount,
        "affiliate_id": affiliateId,
        //"email_confirmation_code": emailConfirmationCode,
        //"email_confirmed": emailConfirmed,
        "password_reset_code": passwordResetCode,
        "github_refresh_token": githubRefreshToken,
        "google_refresh_token": googleRefreshToken,
        "iyzico_id": iyzicoId,
        //"revenuecat_id": revenuecatId,
        "apple_id": appleId,
        "apple_token": appleToken,
        "apple_refresh_token": appleRefreshToken,
        "razorpay_id": razorpayId,
      };
}
