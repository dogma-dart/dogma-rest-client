// Copyright (c) 2015, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

library dogma_rest_client.src.message;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

class Message {
  final Map<String, String> headers = <String, String>{};
  final Map<String, dynamic> context = <String, dynamic>{};
  Uri url;
  dynamic body;
}
