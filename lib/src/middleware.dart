// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.src.middleware;

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'request.dart';
import 'response.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

typedef RequestHandler(Request request);
typedef ResponseHandler(Response response);

class Middleware {
  request(Request request) => request;
  response(Response response) => response;
}

class _Middleware implements Middleware {
  final RequestHandler _requestHandler;
  final ResponseHandler _responseHandler;

  _Middleware(this._requestHandler, this._responseHandler);

  @override
  Request request(Request request) {
    return _requestHandler != null
        ? _requestHandler(request)
        : request;
  }

  @override
  Response response(Response response) {
    return _responseHandler != null
        ? _responseHandler(response)
        : response;
  }
}

Middleware middleware({RequestHandler requestHandler,
                       ResponseHandler responseHandler})
    => new _Middleware(requestHandler, responseHandler);
