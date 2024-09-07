import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_client.dart';
import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_client_response.dart';
import 'package:gestao_financeira/app/service/rest_client/exceptions/rest_cliente_exception.dart';
import 'package:gestao_financeira/app/utils/constants.dart';
import 'package:gestao_financeira/app/utils/environments.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;

  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
  );

  DioRestClient({
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? _defaultOptions);

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }

  @override
  RestClient auth() {
    _defaultOptions.headers['Authorization'] =
        Environments.param(Constants.ENV_TOKEM) ?? '';
    return this;
  }

  @override
  RestClient authAndSenha(String codCliente) {
    // _defaultOptions.headers['Authorization'] =
    //     Environments.param(Constants.ENV_TOKEM) ?? '';
    _defaultOptions.headers['Senha'] = codCliente;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  RestClient addHeader(String key, value) {
    _defaultOptions.headers[key] = value;
    return this;
  }

  @override
  Future<RestClientResponse<T>> detele<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> resquest<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioException e) {
    final response = e.response;

    throw RestClienteException(
      message: e.message,
      statusCode: response?.statusCode,
      error: e.error,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }
}
