// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.src.pipeline;

import 'dart:async';

import 'middleware.dart';
import 'request.dart';
import 'response.dart';

class Pipeline {
  final List<Middleware> _middlewares = new List<Middleware>();

  void addMiddleware(Middleware middleware) {
    _middlewares.add(middleware);
  }

  Future<Request> request(Request request) async {
    for (var middleware in _middlewares) {
      request = middleware.request(request);

      if (request is Future) {
        request = await request;
      }
    }

    return request;
  }

  Future<Response> response(Response response) async {
    for (var middleware in _middlewares) {
      response = middleware.response(response);

      if (response is Future) {
        response = await response;
      }
    }

    return response;
  }
}
