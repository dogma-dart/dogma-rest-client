// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.token_middleware;

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_rest_client/rest_client.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

class TokenMiddleware extends Middleware {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  final String accessToken;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  TokenMiddleware(this.accessToken);

  //---------------------------------------------------------------------
  // Middleware
  //---------------------------------------------------------------------

  Request request(Request request) {
    // Add the token to the headers
    request.headers['Authorization'] = 'Bearer $accessToken';

    return request;
  }
}
