import 'package:equatable/equatable.dart';

class UpdateUserRequest extends Equatable {
  final String? uuid;
  final String? id;

  const UpdateUserRequest({
    required this.id,
    required this.uuid,
  });

  @override
  List<Object?> get props => [id, uuid];

  Map toJson() {
    return {'id': id, 'uuid': uuid};
  }
}
