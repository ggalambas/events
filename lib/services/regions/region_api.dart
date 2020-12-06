// import 'dart:convert';
// import 'dart:io';

// import 'package:events/domain/regions/i_region_api.dart';
// import 'package:events/domain/regions/region.dart';
// import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;
// import 'package:pretty_json/pretty_json.dart';

// @LazySingleton(as: IRegionApi)
// class RegionApi implements IRegionApi {
//   // https://flutter.dev/docs/cookbook/networking/authenticated-requests
//   // https://dados.gov.pt/pt/apidoc/
//   //TODO securely store key
//   // https://pub.dev/packages/flutter_secure_storage/example
//   final String apiKey =
//       'eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjoiNWZiYmY1YzY0NTRhZTM2ZTk3ZGFkZDBkIiwidGltZSI6MTYwNjQ3NDM0Ny45MTExMDZ9.XuYp9_o2H1WNHDPWYgp7ouQ-tr8OVoSBS7Hu3k0ZcP8ibRkIuYjaVCR4EXZs6BlxczwrzqzkgqkvuBglM0ii0Q';
//   final String api = "https://dados.gov.pt/api/1/";

//   Future response() async {
//     final response = await http.get(
//       '$api/organizations/agencia-para-a-modernizacao-administrativa',
//       headers: {HttpHeaders.authorizationHeader: apiKey},
//     );

//     final responseJson = jsonDecode(response.body);
//     printPrettyJson(responseJson);
//     // .forEach((element) => print(element['name'] + '-----' + element['uri']));
//   }

//   @override
//   bool isNear(Region region) {
//     // TODO: implement isNear
//     throw UnimplementedError();
//   }
// }
