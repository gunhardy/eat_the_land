import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class MarkerUtils {
  static Future<BitmapDescriptor> createCustomMarkerFromNetworkImage(String imageUrl) async {
    try {
      final http.Response response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        Uint8List uint8list = response.bodyBytes;

        img.Image? image = img.decodeImage(uint8list);

        if (image != null) {
          img.Image circularImage = img.copyCropCircle(image);

          Uint8List resizedUint8List = Uint8List.fromList(img.encodePng(circularImage));

          ui.Codec codec = await ui.instantiateImageCodec(resizedUint8List);
          ui.FrameInfo fi = await codec.getNextFrame();

          ByteData? byteData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
          Uint8List finalImage = byteData!.buffer.asUint8List();

          return BitmapDescriptor.bytes(finalImage, width: 50, height: 50);
        }
      }
    } catch (e) {
      return BitmapDescriptor.defaultMarker;
    }

    return BitmapDescriptor.defaultMarker;
  }
}

