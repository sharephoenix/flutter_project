import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class BaseApi {
  final baseUrl = "https://www.fastmock.site/mock/93204edebb034ad9478eb047a19177a0/getLoginCode";

  Future<String> postRequest({String path = "/api/sendCode", Map<String, String> headers}) async {
    final url = '$baseUrl${path}';
    print(url);
    var response = await http.post(url, body: 'name=doodle&color=blue');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print('$jsonResponse');
      return convert.jsonEncode(jsonResponse);
    }
    return "";
  }

  fetchRequest({String path = "/api/getMobileCode"}) async {
    final url = baseUrl + path;
    var response = await http.get(url);
    print('$response');
    if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
    print('$jsonResponse');
    } else {
    print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class BaseApiTest {

  _getLoginCode() async {
    var url = 'https://www.fastmock.site/mock/93204edebb034ad9478eb047a19177a0/getLoginCode/api/getMobileCode';
    var response = await http.get(url);
    print('$response');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
      print('$jsonResponse');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  _getLoginSyncCode() {
    var url = 'http://127.0.0.1:30009/getCode/18817322818';
    print('$url');
    http.get(url).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }

  void _requestNetwork() async {
    // 1.创建HttpClient对象
    final httpClient = HttpClient();

    // 2.构建请求的uri
    final uri = Uri.parse("https://www.fastmock.site/mock/93204edebb034ad9478eb047a19177a0/getLoginCode/api/getMobileCode");
    print('$uri');
    // 3.构建请求
    final request = await httpClient.getUrl(uri);

    // 4.发送请求，必须
    final response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      print(await response.transform(utf8.decoder).join());
    } else {
      print(response.statusCode);
    }
  }
}