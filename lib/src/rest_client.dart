// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.src.request_client;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'pipeline.dart';
import 'request.dart';
import 'response.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

abstract class RestClient {
  final Pipeline pipeline = new Pipeline();

  /// Performs the logic to make the [request].
  Future<Response> makeRequest(Request request);

  Future<dynamic> open(Uri url, String method) async {
    // Create the request
    var request = new Request();
    request.url = url;
    request.method = method;

    // Apply the request pipeline
    request = await pipeline.request(request);

    // Make the request
    var response = await makeRequest(request);

    // Apply the response pipeline
    response = await pipeline.response(response);

    // Return the response body
    return response.body;
  }
}
