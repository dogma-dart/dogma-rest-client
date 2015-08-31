// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.rest_client_io;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';
import 'dart:convert';
import 'dart:io';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_rest_client/rest_client.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

class RestClientIo extends RestClient {
  static final HttpClient _httpClient = new HttpClient();

  @override
  Future<Response> makeRequest(Request request) async {
    // Open the request
    var httpClientRequest = await _httpClient.openUrl(request.method, request.url) as HttpClientRequest;

    // Set the headers
    var requestHeaders = httpClientRequest.headers;

    request.headers.forEach((header, value) {
      requestHeaders.set(header, value);
    });

    var httpClientResponse = await httpClientRequest.close() as HttpClientResponse;

    print(httpClientResponse.statusCode);

    // Read the response
    var buffer = new StringBuffer();
    await for (var value in httpClientResponse.transform(UTF8.decoder)) {
      buffer.write(value);
    }

    return new Response()
        ..body = buffer.toString();
  }
}
