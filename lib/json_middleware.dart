// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.token_middleware;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:convert';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_rest_client/rest_client.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

class JsonMiddleware implements Middleware {
  //---------------------------------------------------------------------
  // Middleware
  //---------------------------------------------------------------------

  Request request(Request request) {
    return request;
  }

  Response response(Response response) {
    // Attempt to convert the body
    var body = response.body;

    if (body != null) {
      response.body = JSON.decode(body);
    }

    return response;
  }
}
