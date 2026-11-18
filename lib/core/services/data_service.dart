abstract class DatabaseService {
  Future<void> addData(
    String path,
    Map<String, dynamic> data,
    String? documentId,
  );
  Future<dynamic> getData({
    required String path,
    String? uId,
    Map<String, dynamic> query,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
