// import 'dart:convert';
//
// GuardianApi guardianApiFromMap(String str) => GuardianApi.fromMap(json.decode(str));
//
// String guardianApiToMap(GuardianApi data) => json.encode(data.toMap());
//
// class GuardianApi {
//   Response response;
//
//   GuardianApi({
//     required this.response,
//   });
//
//   GuardianApi copyWith({
//     Response? response,
//   }) =>
//       GuardianApi(
//         response: response ?? this.response,
//       );
//
//   factory GuardianApi.fromMap(Map<String, dynamic> json) => GuardianApi(
//     response: Response.fromMap(json["response"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "response": response.toMap(),
//   };
// }
//
//
//
//
//
//
