class StudentResponse {
  final StudData? studData;
  final String? html;
  final String? message;

  StudentResponse({this.studData, this.html, this.message});

  factory StudentResponse.fromJson(Map<String, dynamic> json) {
    return StudentResponse(
      studData: json['stud_data'] != null
          ? StudData.fromJson(json['stud_data'])
          : null,
      html: json['html'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stud_data': studData?.toJson(),
      'html': html,
      'message': message,
    };
  }
}

class StudData {
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? registrationId;
  final String? studentName;
  final String? emailId;
  final String? gender;
  final String? year;
  final String? rollNumber;
  final String? attending;
  final String? noOfPersonAccompanying;
  final String? campus;
  final int? kurtaSize;
  final int? pyjamaSize;
  final String? dressStatus;
  final String? status;
  final String? namingSeries;
  final int? qrSend;
  final String? doctype;
  final List<CheckInTime>? checkInTime;

  StudData({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.registrationId,
    this.studentName,
    this.emailId,
    this.gender,
    this.year,
    this.rollNumber,
    this.attending,
    this.noOfPersonAccompanying,
    this.campus,
    this.kurtaSize,
    this.pyjamaSize,
    this.dressStatus,
    this.status,
    this.namingSeries,
    this.qrSend,
    this.doctype,
    this.checkInTime,
  });

  factory StudData.fromJson(Map<String, dynamic> json) {
    return StudData(
      name: json['name'],
      owner: json['owner'],
      creation: json['creation'],
      modified: json['modified'],
      modifiedBy: json['modified_by'],
      docstatus: json['docstatus'],
      idx: json['idx'],
      registrationId: json['registration_id'],
      studentName: json['student_name'],
      emailId: json['email_id'],
      gender: json['gender'],
      year: json['year'],
      rollNumber: json['roll_number'],
      attending: json['attending'],
      noOfPersonAccompanying: json['no_of_person_accompanying'],
      campus: json['campus'],
      kurtaSize: json['kurta_size'],
      pyjamaSize: json['pyjama_size'],
      dressStatus: json['dress_status'],
      status: json['status'],
      namingSeries: json['naming_series'],
      qrSend: json['qr_send'],
      doctype: json['doctype'],
      checkInTime: json['check_in_time'] != null
          ? (json['check_in_time'] as List)
              .map((e) => CheckInTime.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'docstatus': docstatus,
      'idx': idx,
      'registration_id': registrationId,
      'student_name': studentName,
      'email_id': emailId,
      'gender': gender,
      'year': year,
      'roll_number': rollNumber,
      'attending': attending,
      'no_of_person_accompanying': noOfPersonAccompanying,
      'campus': campus,
      'kurta_size': kurtaSize,
      'pyjama_size': pyjamaSize,
      'dress_status': dressStatus,
      'status': status,
      'naming_series': namingSeries,
      'qr_send': qrSend,
      'doctype': doctype,
      'check_in_time': checkInTime?.map((e) => e.toJson()).toList(),
    };
  }
}

class CheckInTime {
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final int? docstatus;
  final int? idx;
  final String? inTime;
  final String? parent;
  final String? parentfield;
  final String? parenttype;
  final String? doctype;

  CheckInTime({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.docstatus,
    this.idx,
    this.inTime,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.doctype,
  });

  factory CheckInTime.fromJson(Map<String, dynamic> json) {
    return CheckInTime(
      name: json['name'],
      owner: json['owner'],
      creation: json['creation'],
      modified: json['modified'],
      modifiedBy: json['modified_by'],
      docstatus: json['docstatus'],
      idx: json['idx'],
      inTime: json['in_time'],
      parent: json['parent'],
      parentfield: json['parentfield'],
      parenttype: json['parenttype'],
      doctype: json['doctype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'docstatus': docstatus,
      'idx': idx,
      'in_time': inTime,
      'parent': parent,
      'parentfield': parentfield,
      'parenttype': parenttype,
      'doctype': doctype,
    };
  }
}
