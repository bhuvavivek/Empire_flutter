import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Empire Group Code

class EmpireGroup {
  static String getBaseUrl() => 'https://backend.empireproperties.in/';
  static Map<String, String> headers = {};
  static LoginUserCall loginUserCall = LoginUserCall();
  static UserProfileCall userProfileCall = UserProfileCall();
  static GetCityCall getCityCall = GetCityCall();
  static EditUserProfileCall editUserProfileCall = EditUserProfileCall();
  static EditUserProfileImageCall editUserProfileImageCall =
      EditUserProfileImageCall();
  static GetAreaByCityCall getAreaByCityCall = GetAreaByCityCall();
  static GetPropertyByAreaIdCall getPropertyByAreaIdCall =
      GetPropertyByAreaIdCall();
  static GetFullProjectDetailsByProjectIdCall
      getFullProjectDetailsByProjectIdCall =
      GetFullProjectDetailsByProjectIdCall();
  static PropertyDetailsByPropertyIdCall propertyDetailsByPropertyIdCall =
      PropertyDetailsByPropertyIdCall();
  static GetUnitPlanByPropertyIdCall getUnitPlanByPropertyIdCall =
      GetUnitPlanByPropertyIdCall();
  static GetChargeByProjectIdCall getChargeByProjectIdCall =
      GetChargeByProjectIdCall();
  static GetTowerByPropertyIdCall getTowerByPropertyIdCall =
      GetTowerByPropertyIdCall();
  static GetPropertyPDFByPropertyIdCall getPropertyPDFByPropertyIdCall =
      GetPropertyPDFByPropertyIdCall();
  static GetAllPropertyWithSearchAndFilterCall
      getAllPropertyWithSearchAndFilterCall =
      GetAllPropertyWithSearchAndFilterCall();
  static GetAreaCall getAreaCall = GetAreaCall();
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? email = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "password": "$password",
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login User',
      apiUrl: '${baseUrl}api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? loginToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Profile',
      apiUrl: '${baseUrl}api/profile/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user._id''',
      ));
  String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? userRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.role''',
      ));
  List? citiesList(dynamic response) => getJsonField(
        response,
        r'''$.cities''',
        true,
      ) as List?;
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.last_name''',
      ));
  String? profileImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.profileimage''',
      ));
}

class GetCityCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get City',
      apiUrl: '${baseUrl}api/city/cityinfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List<String>? cityId(dynamic response) => (getJsonField(
        response,
        r'''$.data.cities[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cityName(dynamic response) => (getJsonField(
        response,
        r'''$.data.cities[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? cityDataList(dynamic response) => getJsonField(
        response,
        r'''$.data.cities''',
        true,
      ) as List?;
}

class EditUserProfileCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "$firstName",
  "last_name": "$lastName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit User Profile',
      apiUrl: '${baseUrl}api/auth/user/edit',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updateduser.first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updateduser.last_name''',
      ));
}

class EditUserProfileImageCall {
  Future<ApiCallResponse> call({
    String? token = '',
    FFUploadedFile? file,
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Edit User Profile Image',
      apiUrl: '${baseUrl}api/auth/user/profile/edit',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAreaByCityCall {
  Future<ApiCallResponse> call({
    String? cityId = '',
    String? token = '',
    String? search = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Area By City',
      apiUrl: '${baseUrl}api/city/area/user/$cityId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? areaList(dynamic response) => getJsonField(
        response,
        r'''$.data.areas''',
        true,
      ) as List?;
  List<String>? areaId(dynamic response) => (getJsonField(
        response,
        r'''$.data.areas[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? areaName(dynamic response) => (getJsonField(
        response,
        r'''$.data.areas[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPropertyByAreaIdCall {
  Future<ApiCallResponse> call({
    String? areaId = '',
    String? token = '',
    String? search = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Property By Area Id',
      apiUrl: '${baseUrl}api/property/getbyarea/$areaId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isSucess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.sucess''',
      ));
  List? propertymainList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? propertyId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? projectName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].Projectname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? projectOwenerName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? projectOwenerNumber(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? projectOwenerEmail(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerEmail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? possesion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].possesion''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? transactionType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].transactionType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? developerName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].developerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? projectArea(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? cityName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].city.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? complitionDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].complitionDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? approvedBy(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].approvedBy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? imageList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].projectImages''',
        true,
      ) as List?;
  List? imagejsondata(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? unitOFSize(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uniteOfSize''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? isSampleHouse(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].sampleHouse''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class GetFullProjectDetailsByProjectIdCall {
  Future<ApiCallResponse> call({
    String? propId = '',
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Full Project Details By Project Id',
      apiUrl: '${baseUrl}api/property/getinfo/$propId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? propUnitOfSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.uniteOfSize.size''',
      ));
  String? propUnitOfUnit(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.uniteOfSize.unit''',
      ));
  String? projectId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property._id''',
      ));
  String? projectOwenerName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.projectOwnerName''',
      ));
  int? projectOwenerNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.projectOwnerNumber''',
      ));
  String? projectOwenerEmail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.projectOwnerEmail''',
      ));
  String? projectName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.Projectname''',
      ));
  String? projectLaunchDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.launchDate''',
      ));
  String? projectComplitionDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.complitionDate''',
      ));
  String? propertyReraNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.reraNumber''',
      ));
  int? propertyArea(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.projectArea''',
      ));
  String? propertyPossesion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.possesion''',
      ));
  String? propertyTransactionType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.transactionType''',
      ));
  String? propertyDeveloperName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.developerName''',
      ));
  String? propertyApprovedBy(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.approvedBy''',
      ));
  String? propertySpecification(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.specifications''',
      ));
  String? propertyAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.address''',
      ));
  String? propertyAreaName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.area.name''',
      ));
  String? propertyCityId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.city._id''',
      ));
  String? propertyCityName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.city.name''',
      ));
  List<String>? towerName(dynamic response) => (getJsonField(
        response,
        r'''$.data.towers[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? towerId(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].towerId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? propertyType(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].proprtyType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bedRoom(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].bedRoom''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? bookingAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].bookingAmount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? area(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].area''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bsp(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].bsp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? builtUp(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].builtUp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? carpateArea(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].carpateArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otherArea(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].otherArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? totalUnit(dynamic response) => (getJsonField(
        response,
        r'''$.data.unitplans[:].totalUnit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? chargeTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data.projectcharge[:].chargetitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rateTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data.projectcharge[:].rateTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rateof(dynamic response) => (getJsonField(
        response,
        r'''$.data.projectcharge[:].rateOf''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? floorEscalation(dynamic response) => (getJsonField(
        response,
        r'''$.data.projectcharge[:].floorEscalation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gst(dynamic response) => (getJsonField(
        response,
        r'''$.data.projectcharge[:].gst''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PropertyDetailsByPropertyIdCall {
  Future<ApiCallResponse> call({
    String? propertyId = '',
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Property Details By Property Id',
      apiUrl: '${baseUrl}api/property/getinfo/$propertyId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? projectName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.Projectname''',
      ));
  List<String>? projectImageList(dynamic response) => (getJsonField(
        response,
        r'''$.data.property.projectImages''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? ownerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.projectOwnerName''',
      ));
  int? ownerNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.projectOwnerNumber''',
      ));
  String? ownerEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.projectOwnerEmail''',
      ));
  String? launchDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.launchDate''',
      ));
  String? comlitionDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.complitionDate''',
      ));
  String? reraNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.reraNumber''',
      ));
  double? projectArea(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.property.projectArea''',
      ));
  int? unitOfSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.uniteOfSize''',
      ));
  String? possesion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.possesion''',
      ));
  String? transactionType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.transactionType''',
      ));
  String? developerName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.developerName''',
      ));
  String? approvedBy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.approvedBy''',
      ));
  String? specifications(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.specifications''',
      ));
  List<String>? aminitiesList(dynamic response) => (getJsonField(
        response,
        r'''$.data.property.aminities''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? landMark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.landMark''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.address''',
      ));
  String? areaName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.area.name''',
      ));
  String? cityName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.city.name''',
      ));
  String? remarks(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.remarks''',
      ));
  String? resourcePersonDetails(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.property.resourcePersonDetail''',
      ));
  double? minArea(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.property.minArea''',
      ));
  double? maxArea(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.property.maxArea''',
      ));
  double? minBSP(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.property.minBsp''',
      ));
  double? maxBSP(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.property.maxBsp''',
      ));
  int? totalUnit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.totalUnit''',
      ));
  bool? apiCallSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? locationLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.property.locationlink''',
      ));
  int? totalFloor(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.totalFloor''',
      ));
  int? totalTower(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.property.totalTower''',
      ));
  bool? isSampleHouse(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.property.sampleHouse''',
      ));
}

class GetUnitPlanByPropertyIdCall {
  Future<ApiCallResponse> call({
    String? propertyId = '',
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Unit Plan By Property Id',
      apiUrl: '${baseUrl}api/property/unitplan/$propertyId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? unitplanIdList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bedroomList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].bedRoom''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? commercialTypeLIst(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].commercialtype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? bookingAmountList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].bookingAmount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? carpetAreaList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].carpateArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? builtUpList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].builtUp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otherAreaList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].otherArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? areaList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].area''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalUnit(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].totalUnit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? bspList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].bsp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? propertyTypeList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].proprtyType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? towerNameList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].towerId.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalBathroom(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].totalBathRoom''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? totalParking(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].totalParking''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetChargeByProjectIdCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? projectId = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Charge By Project Id',
      apiUrl: '${baseUrl}api/property/charge/$projectId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? chargeTitleList(dynamic response) => (getJsonField(
        response,
        r'''$.charges[:].chargetitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rateTitleList(dynamic response) => (getJsonField(
        response,
        r'''$.charges[:].rateTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? rateOfList(dynamic response) => (getJsonField(
        response,
        r'''$.charges[:].rateOf''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? gstList(dynamic response) => (getJsonField(
        response,
        r'''$.charges[:].gst''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? remarkeLisy(dynamic response) => (getJsonField(
        response,
        r'''$.charges[:].chargeremark''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetTowerByPropertyIdCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? propertyId = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Tower By Property Id',
      apiUrl: '${baseUrl}api/property/unitplan/$propertyId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? towerNameList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].towerId.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? towerType(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].proprtyType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bedroomList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].bedRoom''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? commercialtype(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].commercialtype''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bspList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].bsp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? carpetAreaList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].carpateArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otherList(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].otherArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? totalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].totalPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? superArea(dynamic response) => (getJsonField(
        response,
        r'''$.unitplan[:].area''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetPropertyPDFByPropertyIdCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? propId = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Property PDF By Property Id',
      apiUrl: '${baseUrl}api/upload/propertypdf/$propId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? pdfNameList(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pdfIdList(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pdfUrlList(dynamic response) => (getJsonField(
        response,
        r'''$.documents[:].pdfurl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllPropertyWithSearchAndFilterCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? search = '',
    List<String>? properyTypeList,
    List<String>? bhkList,
    List<String>? areaList,
    List<String>? possesionList,
    List<String>? priceRangeList,
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();
    final properyType = _serializeList(properyTypeList);
    final bhk = _serializeList(bhkList);
    final area = _serializeList(areaList);
    final possesion = _serializeList(possesionList);
    final priceRange = _serializeList(priceRangeList);

    final ffApiRequestBody = '''
{
  "properyType": $properyType,
  "bhk": $bhk,
  "area": $area,
  "possesion": $possesion,
  "priceRange": $priceRange
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Property With Search And Filter',
      apiUrl: '${baseUrl}api/property/get/properties',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? projectId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? projectName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].Projectname''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? projectImageList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectImages''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? owenerName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? ownerNumber(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ownerEmail(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectOwnerEmail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? possesion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].possesion''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? developerName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].developerName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? approveBy(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].approvedBy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lunchDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].launchDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? allData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<int>? projectArea(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].projectArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? unitofSize(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uniteOfSize''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? isSampleHouse(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].sampleHouse''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class GetAreaCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EmpireGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Area',
      apiUrl: '${baseUrl}api/city/areainfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? areaList(dynamic response) => getJsonField(
        response,
        r'''$.data.areas''',
        true,
      ) as List?;
  List<String>? areaId(dynamic response) => (getJsonField(
        response,
        r'''$.data.areas[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? areaName(dynamic response) => (getJsonField(
        response,
        r'''$.data.areas[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Empire Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
