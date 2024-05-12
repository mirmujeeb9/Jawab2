import 'dart:developer';
import 'dart:io';

import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:path/path.dart';

class Edit_profile_controller extends GetxController {
  static Edit_profile_controller get to => Get.find();
  Country? selectedcountry;
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  File? image;
  Rx<bool> loading = false.obs;
  void setloading(bool value) {
    loading.value = value;
  }

  void getImage({
    required ImageSource source,
  }) async {
    XFile? picker = await ImagePicker().pickImage(source: source);
    if (picker != null) {
      image = File(picker.path);
      update(['image']);
    }
  }

  void updateProfile({
    required String name,
    // required String surname,
    required String phone,
    required String country,
  }) async {
    setloading(true);
    final Uri url = Uri.parse("${StaticData.baseURL}${StaticData.profile}");

    var request = http.MultipartRequest('POST', url);

    request.fields['name'] = name;
    request.fields['_method'] = "PATCH";
    // request.fields['surname'] = surname;
    request.fields['phone'] = phone;
    request.fields['country'] = country;

    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'avatar',
          image!.path,
          filename: basename(image!.path),
        ),
      );
    }

    try {
      request.headers.addAll(
        {
          "Content-Type": "multipart/form-data",
          "Authorization": "Bearer ${StaticData.token}"
        },
      );
      var response = await request.send();
      if (response.statusCode == 200) {
        setloading(false);

        if (image != null) {
          Splash_controller.to.getuser().then((value) {
            update(['image']);
          });
        }
        showCustomSnackBar('Successfully updated', isError: false);
      } else {
        setloading(false);
        log('Error: ${response.statusCode}');
      }
    } catch (e) {
      setloading(false);
      log('Error: $e');
    }
  }
}
