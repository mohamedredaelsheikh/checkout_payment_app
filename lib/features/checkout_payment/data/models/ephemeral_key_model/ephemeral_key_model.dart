import 'dart:convert';

import 'associated_object.dart';

class EphemeralKeyModel {
	String? id;
	String? object;
	List<AssociatedObject>? associatedObjects;
	int? created;
	int? expires;
	bool? livemode;
	String? secret;

	EphemeralKeyModel({
		this.id, 
		this.object, 
		this.associatedObjects, 
		this.created, 
		this.expires, 
		this.livemode, 
		this.secret, 
	});

	factory EphemeralKeyModel.fromMap(Map<String, dynamic> data) {
		return EphemeralKeyModel(
			id: data['id'] as String?,
			object: data['object'] as String?,
			associatedObjects: (data['associated_objects'] as List<dynamic>?)
						?.map((e) => AssociatedObject.fromMap(e as Map<String, dynamic>))
						.toList(),
			created: data['created'] as int?,
			expires: data['expires'] as int?,
			livemode: data['livemode'] as bool?,
			secret: data['secret'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'object': object,
				'associated_objects': associatedObjects?.map((e) => e.toMap()).toList(),
				'created': created,
				'expires': expires,
				'livemode': livemode,
				'secret': secret,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EphemeralKeyModel].
	factory EphemeralKeyModel.fromJson(String data) {
		return EphemeralKeyModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [EphemeralKeyModel] to a JSON string.
	String toJson() => json.encode(toMap());
}
