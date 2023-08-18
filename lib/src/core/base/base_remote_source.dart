/*
 * Copyright (c) 2022
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:ferry/ferry.dart';
import 'package:calendar/localization/l10n.dart';

import '../errors/api_exception.dart';
import '../logging/logger.dart';

class BaseRemoteSource {
  BaseRemoteSource(this._client);

  final Client _client;

  /// Request to remote source with provided ferry operation request.
  ///
  /// Handles GraphQL error and throws to api errors
  Future<TData> networkRequest<TData, TVars>(
    OperationRequest<TData, TVars> operationRequest,
  ) async {
    final response = await _client.request(operationRequest).first;
    if (response.hasErrors) {
      // link exception is throws when like server is down and give 5xx error
      // throw response.graphqlErrors ?? response.linkException!;
      throw response.toApiException;
    } else if (response.data != null) {
      return response.data!;
    } else {
      throw ApiException.serverException(message: l10n.serverError);
    }
  }
}

extension ApiExceptionXGraphQl<TData, TVars>
    on OperationResponse<TData, TVars> {
  /// Convert GraphQl errors in OperationResponse to ApiException
  ApiException get toApiException {
    if (graphqlErrors?.isNotEmpty ?? false) {
      // we are interested for first error only
      final firstError = graphqlErrors!.first;
      return ApiException.serverException(message: firstError.message);
    } else if (linkException != null) {
      logger.d(linkException?.originalException.toString());
      return ApiException.serverException(
          message:
              linkException?.originalException.toString() ?? l10n.serverError);
    } else {
      return ApiException.serverException(message: l10n.serverError);
    }
  }
}
