// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.rest_client_html;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:async';
import 'dart:html';

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_rest_client/rest_client.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

class RestClientHtml extends RestClient {
  @override
  Future<Response> makeRequest(Request request) {
    var httpRequest = new HttpRequest();
    var completer = new Completer<Response>();

    // Listen for events
    httpRequest.onReadyStateChange.listen((evt) {
      if (httpRequest.readyState == HttpRequest.DONE) {
        var response = new Response()
            ..body = httpRequest.responseText;

        completer.complete(response);
      }
    });

    // Open the request
    httpRequest.open(request.method, request.url.toString());

    // Set the headers
    request.headers.forEach((header, value) {
      httpRequest.setRequestHeader(header, value);
    });

    // Send the request
    httpRequest.send();

    return completer.future;
  }
}
