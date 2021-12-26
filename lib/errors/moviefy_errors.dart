abstract class MoviefyError implements Exception {
  String? message;

  @override
  String toString() {
    return message!;
  }
}

class MoviefyApiRepositoryError extends MoviefyError {
  MoviefyApiRepositoryError(String message) {
    this.message = message;
  }
}
