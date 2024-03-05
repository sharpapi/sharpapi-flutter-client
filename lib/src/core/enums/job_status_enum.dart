enum SharpApiJobStatusEnum {
  NEW,
  PENDING,
  FAILED,
  SUCCESS,
}

extension SharpApiJobStatusEnumExtension on SharpApiJobStatusEnum {
  String get label {
    switch (this) {
      case SharpApiJobStatusEnum.NEW:
        return 'new';
      case SharpApiJobStatusEnum.PENDING:
        return 'pending';
      case SharpApiJobStatusEnum.FAILED:
        return 'failed';
      case SharpApiJobStatusEnum.SUCCESS:
        return 'success';
    }
  }
}