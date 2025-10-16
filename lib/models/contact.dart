/// Model class for contact information
class ContactInfo {
  final String email;
  final String? phone;
  final String? location;
  final String? website;
  final SocialMedia socialMedia;

  const ContactInfo({
    required this.email,
    this.phone,
    this.location,
    this.website,
    required this.socialMedia,
  });

  /// Create a copy of the contact info with updated fields
  ContactInfo copyWith({
    String? email,
    String? phone,
    String? location,
    String? website,
    SocialMedia? socialMedia,
  }) {
    return ContactInfo(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      website: website ?? this.website,
      socialMedia: socialMedia ?? this.socialMedia,
    );
  }

  /// Convert contact info to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'location': location,
      'website': website,
      'socialMedia': socialMedia.toJson(),
    };
  }

  /// Create contact info from JSON
  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json['email'] as String,
      phone: json['phone'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      socialMedia: SocialMedia.fromJson(
        json['socialMedia'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  String toString() {
    return 'ContactInfo(email: $email, phone: $phone, location: $location)';
  }
}

/// Model class for social media links
class SocialMedia {
  final String? github;
  final String? linkedin;
  final String? twitter;
  final String? instagram;
  final String? facebook;
  final String? youtube;
  final String? behance;
  final String? dribbble;
  final String? medium;
  final String? stackoverflow;

  const SocialMedia({
    this.github,
    this.linkedin,
    this.twitter,
    this.instagram,
    this.facebook,
    this.youtube,
    this.behance,
    this.dribbble,
    this.medium,
    this.stackoverflow,
  });

  /// Get all non-null social media links
  Map<String, String> get allLinks {
    final links = <String, String>{};
    if (github != null) links['GitHub'] = github!;
    if (linkedin != null) links['LinkedIn'] = linkedin!;
    if (twitter != null) links['Twitter'] = twitter!;
    if (instagram != null) links['Instagram'] = instagram!;
    if (facebook != null) links['Facebook'] = facebook!;
    if (youtube != null) links['YouTube'] = youtube!;
    if (behance != null) links['Behance'] = behance!;
    if (dribbble != null) links['Dribbble'] = dribbble!;
    if (medium != null) links['Medium'] = medium!;
    if (stackoverflow != null) links['Stack Overflow'] = stackoverflow!;
    return links;
  }

  /// Create a copy of the social media with updated fields
  SocialMedia copyWith({
    String? github,
    String? linkedin,
    String? twitter,
    String? instagram,
    String? facebook,
    String? youtube,
    String? behance,
    String? dribbble,
    String? medium,
    String? stackoverflow,
  }) {
    return SocialMedia(
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
      twitter: twitter ?? this.twitter,
      instagram: instagram ?? this.instagram,
      facebook: facebook ?? this.facebook,
      youtube: youtube ?? this.youtube,
      behance: behance ?? this.behance,
      dribbble: dribbble ?? this.dribbble,
      medium: medium ?? this.medium,
      stackoverflow: stackoverflow ?? this.stackoverflow,
    );
  }

  /// Convert social media to JSON
  Map<String, dynamic> toJson() {
    return {
      'github': github,
      'linkedin': linkedin,
      'twitter': twitter,
      'instagram': instagram,
      'facebook': facebook,
      'youtube': youtube,
      'behance': behance,
      'dribbble': dribbble,
      'medium': medium,
      'stackoverflow': stackoverflow,
    };
  }

  /// Create social media from JSON
  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      github: json['github'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      facebook: json['facebook'] as String?,
      youtube: json['youtube'] as String?,
      behance: json['behance'] as String?,
      dribbble: json['dribbble'] as String?,
      medium: json['medium'] as String?,
      stackoverflow: json['stackoverflow'] as String?,
    );
  }

  @override
  String toString() {
    return 'SocialMedia(${allLinks.keys.join(', ')})';
  }
}

/// Model class for contact form data
class ContactMessage {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String subject;
  final String message;
  final DateTime timestamp;
  final ContactMessageStatus status;
  final String? reply;
  final DateTime? repliedAt;

  const ContactMessage({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.subject,
    required this.message,
    required this.timestamp,
    this.status = ContactMessageStatus.unread,
    this.reply,
    this.repliedAt,
  });

  /// Create a copy of the contact message with updated fields
  ContactMessage copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? subject,
    String? message,
    DateTime? timestamp,
    ContactMessageStatus? status,
    String? reply,
    DateTime? repliedAt,
  }) {
    return ContactMessage(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      reply: reply ?? this.reply,
      repliedAt: repliedAt ?? this.repliedAt,
    );
  }

  /// Convert contact message to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'subject': subject,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString().split('.').last,
      'reply': reply,
      'repliedAt': repliedAt?.toIso8601String(),
    };
  }

  /// Create contact message from JSON
  factory ContactMessage.fromJson(Map<String, dynamic> json) {
    return ContactMessage(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      subject: json['subject'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: ContactMessageStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => ContactMessageStatus.unread,
      ),
      reply: json['reply'] as String?,
      repliedAt: json['repliedAt'] != null
          ? DateTime.parse(json['repliedAt'] as String)
          : null,
    );
  }

  @override
  String toString() {
    return 'ContactMessage(id: $id, name: $name, subject: $subject, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContactMessage && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Enum for contact message status
enum ContactMessageStatus { unread, read, replied, archived }

/// Extension for contact message status
extension ContactMessageStatusExtension on ContactMessageStatus {
  String get displayName {
    switch (this) {
      case ContactMessageStatus.unread:
        return 'Unread';
      case ContactMessageStatus.read:
        return 'Read';
      case ContactMessageStatus.replied:
        return 'Replied';
      case ContactMessageStatus.archived:
        return 'Archived';
    }
  }

  String get color {
    switch (this) {
      case ContactMessageStatus.unread:
        return '#F44336'; // Red
      case ContactMessageStatus.read:
        return '#FF9800'; // Orange
      case ContactMessageStatus.replied:
        return '#4CAF50'; // Green
      case ContactMessageStatus.archived:
        return '#9E9E9E'; // Grey
    }
  }
}
