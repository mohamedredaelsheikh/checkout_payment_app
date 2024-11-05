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

	factory EphemeralKeyModel.fromIdEphkey1QHj3qGqBKivowsmYd2PzpAdObjectEphemeralKeyAssociatedObjectsIdCusRa2dmoz6BvrGgSTypeCustomerCreated1730798910Expires1730802510LivemodeFalseSecretEkTestYwNjdF8xUhnsuGtHcUjLaXZvd3NtLev2aDljdDNqNzVjWkRRak9InXpFaDbhnuVwT3M5U3g00abRc0C3z(Map<String, dynamic> json) {
		return EphemeralKeyModel(
			id: json['id'] as String?,
			object: json['object'] as String?,
			associatedObjects: (json['associated_objects'] as List<dynamic>?)
						?.map((e) => AssociatedObject.fromIdEphkey1QHj3qGqBKivowsmYd2PzpAdObjectEphemeralKeyAssociatedObjectsIdCusRa2dmoz6BvrGgSTypeCustomerCreated1730798910Expires1730802510LivemodeFalseSecretEkTestYwNjdF8xUhnsuGtHcUjLaXZvd3NtLev2aDljdDNqNzVjWkRRak9InXpFaDbhnuVwT3M5U3g00abRc0C3z(e as Map<String, dynamic>))
						.toList(),
			created: json['created'] as int?,
			expires: json['expires'] as int?,
			livemode: json['livemode'] as bool?,
			secret: json['secret'] as String?,
		);
	}



	Map<String, dynamic> toIdEphkey1QHj3qGqBKivowsmYd2PzpAdObjectEphemeralKeyAssociatedObjectsIdCusRa2dmoz6BvrGgSTypeCustomerCreated1730798910Expires1730802510LivemodeFalseSecretEkTestYwNjdF8xUhnsuGtHcUjLaXZvd3NtLev2aDljdDNqNzVjWkRRak9InXpFaDbhnuVwT3M5U3g00abRc0C3z() {
		return {
			'id': id,
			'object': object,
			'associated_objects': associatedObjects?.map((e) => e.toIdEphkey1QHj3qGqBKivowsmYd2PzpAdObjectEphemeralKeyAssociatedObjectsIdCusRa2dmoz6BvrGgSTypeCustomerCreated1730798910Expires1730802510LivemodeFalseSecretEkTestYwNjdF8xUhnsuGtHcUjLaXZvd3NtLev2aDljdDNqNzVjWkRRak9InXpFaDbhnuVwT3M5U3g00abRc0C3z()).toList(),
			'created': created,
			'expires': expires,
			'livemode': livemode,
			'secret': secret,		};
	}
}
