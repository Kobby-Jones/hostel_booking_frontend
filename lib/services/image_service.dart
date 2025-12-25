import 'dart:io';
import 'package:dio/dio.dart';
import 'api/api_client.dart';

class ImageService {
  final Dio _dio = ApiClient.instance;

  /// Step 1: Get a temporary secure upload URL from your backend
  Future<Map<String, dynamic>> getPresignedUrl({
    required String fileName,
    required String fileType,
    String? hostelId,
  }) async {
    final response = await _dio.post("/images/presigned-url", data: {
      "fileName": fileName,
      "fileType": fileType,
      if (hostelId != null) "hostelId": hostelId,
    });
    return response.data["data"];
  }

  /// Step 2: Direct-to-Cloud Upload (Bypasses your API server for speed)
  Future<void> uploadToCloud(String uploadUrl, File file, String contentType) async {
    await Dio().put(
      uploadUrl,
      data: file.openRead(),
      options: Options(
        headers: {
          Headers.contentTypeHeader: contentType,
          Headers.contentLengthHeader: await file.length(),
        },
      ),
    );
  }

  /// Step 3: Notify your backend to save the image metadata
  Future<void> saveMetadata({
    required String url,
    required String key,
    required String hostelId,
    String? caption,
  }) async {
    await _dio.post("/images", data: {
      "url": url,
      "key": key,
      "hostelId": hostelId,
      "caption": caption,
    });
  }
}