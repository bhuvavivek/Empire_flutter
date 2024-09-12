import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String getRandomImagePath(List<String> imagePaths) {
  int randomIndex = math.Random().nextInt(imagePaths.length);
  // Return the image path at the randomly generated index
  return imagePaths[randomIndex];
}

String? splitDate(String dateTimeString) {
  List<String> dateTimeParts = dateTimeString.split("T");
  return dateTimeParts[0];
}

List<String> splitStringForAminitis(String input) {
  return input.split(',');
}

String modifyUrlForImage(String input) {
  String baseUrl = "https://backend.empireproperties.in";
  return baseUrl + input.replaceAll("uploads", "");
}

List<String> getListAtIndex(
  List<dynamic> listOFImageList,
  int index,
) {
  try {
    if (index < 0 || index >= listOFImageList.length) {
      print('Index is out of range');
      return [];
    }

    return List<String>.from(listOFImageList[index]['projectImages']);
  } catch (e) {
    print('An error occurred: $e');
    return [];
  }
}

String greetingForTime() {
  // return greeting string acroding time
  DateTime now = DateTime.now();
  int hour = now.hour;
  if (hour < 12) {
    return "Good morning!";
  } else if (hour < 18) {
    return "Good afternoon!";
  } else {
    return "Good evening!";
  }
}

List<String> getImageUrls(
  List<dynamic> jsonData,
  int index,
) {
  List<String> imageUrlList = [];

  // Ensure the index is within the bounds of the vendors list
  if (index >= 0 && index < jsonData.length) {
    // Retrieve the vendor at the specified index
    Map<String, dynamic> vendor = jsonData[index];

    // Ensure 'vendorImages' key is present in the vendor details
    if (vendor.containsKey('projectImages')) {
      List<dynamic> vendorImages = vendor['projectImages'];

      // Extract imageUrl from each vendor image and add to the list
      for (String image in vendorImages) {
        imageUrlList.add(image);
      }
    }
  }

  return imageUrlList;
}

String pdfurlmodify(String localFilePath) {
  String urlPath = localFilePath.replaceAll('\\', '/');

  // Replace 'uploads' with 'backend.empireproperties.in'
  urlPath = urlPath.replaceFirst('uploads', 'backend.empireproperties.in');

  // Add 'https://' to the beginning of the URL
  urlPath = 'https://' + urlPath;

  return urlPath;
}

String combineLists(
  String value1,
  String value2,
) {
  if (value1.trim().isNotEmpty) {
    return value1;
  } else {
    return value2;
  }
}
