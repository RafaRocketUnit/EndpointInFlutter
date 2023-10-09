class ApiResponse<T> {
  Status status;
  T? list;
  String? message = "loading...";

  ApiResponse.initial(this.message) : status = Status.INITIAL;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.list) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $list";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }