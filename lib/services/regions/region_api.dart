// import 'dart:convert';
// import 'dart:io';

// import 'package:events/domain/regions/i_region_api.dart';
// import 'package:injectable/injectable.dart';
// import 'package:http/http.dart' as http;

// @LazySingleton(as: IRegionApi)
// class RegionApi implements IRegionApi {
//   // https://dados.gov.pt/pt/apidoc/
//   //TODO securely store key
//   // https://pub.dev/packages/flutter_secure_storage/example
//   String apiKey =
//       'eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjoiNWZiYmY1YzY0NTRhZTM2ZTk3ZGFkZDBkIiwidGltZSI6MTYwNjQ3NDM0Ny45MTExMDZ9.XuYp9_o2H1WNHDPWYgp7ouQ-tr8OVoSBS7Hu3k0ZcP8ibRkIuYjaVCR4EXZs6BlxczwrzqzkgqkvuBglM0ii0Q';

//   Future<http.Response> response() => http.get(
//         'https://jsonplaceholder.typicode.com/albums/1',
//         headers: {HttpHeaders.authorizationHeader: apiKey},
//       );
//   // responseJson = jsonDecode(response.body);
// }
