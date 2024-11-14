// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  dynamic coingateSubscriberId;
  dynamic teamId;
  dynamic teamManagerId;
  String name;
  String surname;
  String email;
  dynamic phone;
  String type;
  String avatar;
  dynamic companyName;
  dynamic companyWebsite;
  dynamic country;
  dynamic address;
  dynamic postal;
  int status;
  int remainingWords;
  int remainingImages;
  dynamic lastSeen;
  dynamic githubId;
  dynamic githubToken;
  dynamic googleId;
  dynamic googleToken;
  dynamic facebookId;
  dynamic facebookToken;
  dynamic twitterId;
  dynamic twitterToken;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String affiliateCode;
  String affiliateEarnings;
  dynamic affiliateBankAccount;
  dynamic affiliateId;
  String emailConfirmationCode;
  int emailConfirmed;
  dynamic passwordResetCode;
  dynamic githubRefreshToken;
  dynamic googleRefreshToken;
  dynamic iyzicoId;
  String revenuecatId;
  dynamic appleId;
  dynamic appleToken;
  dynamic appleRefreshToken;
  dynamic razorpayId;

  UserModel({
    this.id = 0,
    this.coingateSubscriberId,
    this.teamId,
    this.teamManagerId,
    this.name = '',
    this.surname = '',
    this.email = '',
    this.phone,
    this.type = '',
    this.avatar = '',
    this.companyName,
    this.companyWebsite,
    this.country,
    this.address,
    this.postal,
    this.status = 0,
    this.remainingWords = 0,
    this.remainingImages = 0,
    this.lastSeen,
    this.githubId,
    this.githubToken,
    this.googleId,
    this.googleToken,
    this.facebookId,
    this.facebookToken,
    this.twitterId,
    this.twitterToken,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    this.affiliateCode = '',
    this.affiliateEarnings = '',
    this.affiliateBankAccount,
    this.affiliateId,
    this.emailConfirmationCode = '',
    this.emailConfirmed = 0,
    this.passwordResetCode,
    this.githubRefreshToken,
    this.googleRefreshToken,
    this.iyzicoId,
    this.revenuecatId = '',
    this.appleId,
    this.appleToken,
    this.appleRefreshToken,
    this.razorpayId,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? 0,
        coingateSubscriberId: json["coingate_subscriber_id"],
        teamId: json["team_id"],
        teamManagerId: json["team_manager_id"],
        name: json["name"] ?? '',
        surname: json["surname"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"],
        type: json["type"] ?? '',
        avatar: json["avatar"] ?? '',
        companyName: json["company_name"],
        companyWebsite: json["company_website"],
        country: json["country"],
        address: json["address"],
        postal: json["postal"],
        status: json["status"] ?? 0,
        remainingWords: json["remaining_words"] ?? 0,
        remainingImages: json["remaining_images"] ?? 0,
        lastSeen: json["last_seen"],
        githubId: json["github_id"],
        githubToken: json["github_token"],
        googleId: json["google_id"],
        googleToken: json["google_token"],
        facebookId: json["facebook_id"],
        facebookToken: json["facebook_token"],
        twitterId: json["twitter_id"],
        twitterToken: json["twitter_token"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
        stripeId: json["stripe_id"],
        pmType: json["pm_type"],
        pmLastFour: json["pm_last_four"],
        trialEndsAt: json["trial_ends_at"],
        affiliateCode: json["affiliate_code"] ?? '',
        affiliateEarnings: json["affiliate_earnings"] ?? '',
        affiliateBankAccount: json["affiliate_bank_account"],
        affiliateId: json["affiliate_id"],
        emailConfirmationCode: json["email_confirmation_code"] ?? '',
        emailConfirmed: json["email_confirmed"] ?? 0,
        passwordResetCode: json["password_reset_code"],
        githubRefreshToken: json["github_refresh_token"],
        googleRefreshToken: json["google_refresh_token"],
        iyzicoId: json["iyzico_id"],
        revenuecatId: json["revenuecat_id"] ?? '',
        appleId: json["apple_id"],
        appleToken: json["apple_token"],
        appleRefreshToken: json["apple_refresh_token"],
        razorpayId: json["razorpay_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coingate_subscriber_id": coingateSubscriberId,
        "team_id": teamId,
        "team_manager_id": teamManagerId,
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone,
        "type": type,
        "avatar": avatar,
        "company_name": companyName,
        "company_website": companyWebsite,
        "country": country,
        "address": address,
        "postal": postal,
        "status": status,
        "remaining_words": remainingWords,
        "remaining_images": remainingImages,
        "last_seen": lastSeen,
        "github_id": githubId,
        "github_token": githubToken,
        "google_id": googleId,
        "google_token": googleToken,
        "facebook_id": facebookId,
        "facebook_token": facebookToken,
        "twitter_id": twitterId,
        "twitter_token": twitterToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "stripe_id": stripeId,
        "pm_type": pmType,
        "pm_last_four": pmLastFour,
        "trial_ends_at": trialEndsAt,
        "affiliate_code": affiliateCode,
        "affiliate_earnings": affiliateEarnings,
        "affiliate_bank_account": affiliateBankAccount,
        "affiliate_id": affiliateId,
        "email_confirmation_code": emailConfirmationCode,
        "email_confirmed": emailConfirmed,
        "password_reset_code": passwordResetCode,
        "github_refresh_token": githubRefreshToken,
        "google_refresh_token": googleRefreshToken,
        "iyzico_id": iyzicoId,
        "revenuecat_id": revenuecatId,
        "apple_id": appleId,
        "apple_token": appleToken,
        "apple_refresh_token": appleRefreshToken,
        "razorpay_id": razorpayId,
      };
}
