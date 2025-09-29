class StudentModel {
  String? time;
  bool? success;
  String? token;
  User? user;

  StudentModel({this.time, this.success, this.token, this.user});

  StudentModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    success = json['success'];
    token = json['Token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['success'] = this.success;
    data['Token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  ProfileInfo? profileInfo;
  CanInfo? canInfo;
  HostelInfo? hostelInfo;
  BusInfo? busInfo;
  AddditionalInfo? addditionalInfo;
  String? roomNo;  // ✅ New field
  String? html;    // ✅ New field

  User({
    this.profileInfo,
    this.canInfo,
    this.hostelInfo,
    this.busInfo,
    this.addditionalInfo,
    this.roomNo,
    this.html,
  });

  User.fromJson(Map<String, dynamic> json) {
    profileInfo = json['profile_info'] != null
        ? ProfileInfo.fromJson(json['profile_info'])
        : null;
    canInfo = json['can_info'] != null
        ? CanInfo.fromJson(json['can_info'])
        : null;
    hostelInfo = json['hostel_info'] != null && json['hostel_info'] != false
        ? HostelInfo.fromJson(json['hostel_info'])
        : null;
    busInfo = json['bus_info'] != null && json['bus_info'] != false
        ? BusInfo.fromJson(json['bus_info'])
        : null;
    addditionalInfo = json['addditional_info'] != null
        ? AddditionalInfo.fromJson(json['addditional_info'])
        : null;
    roomNo = json['room_no'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profileInfo != null) data['profile_info'] = profileInfo!.toJson();
    if (canInfo != null) data['can_info'] = canInfo!.toJson();
    if (hostelInfo != null) data['hostel_info'] = hostelInfo!.toJson();
    if (busInfo != null) data['bus_info'] = busInfo!.toJson();
    if (addditionalInfo != null) data['addditional_info'] = addditionalInfo!.toJson();
    data['room_no'] = roomNo;
    data['html'] = html;
    return data;
  }
}


class ProfileInfo {
  String? splznId;
  String? pgmId;
  String? stdId;
  String? bchId;
  String? stdRegId;
  String? enrlYrId;
  String? hrmsSchId;
  String? stdType;
  String? rollNo;
  String? applicationNo;
  String? referenceNo;
  String? aoapPgmId;
  String? aoapSplznId;
  String? otherAppNo;
  String? otherDesc;
  String? studentRegDate;
  String? stdDocVerFinalStatus;
  String? stdProfVerFinalStatus;
  String? stdEligibilityStat;
  String? appRegId;
  String? stdNameVerifyStatus;
  String? stdDobVerifyStatus;
  String? pgmIdAdmn;
  String? splznIdAdmn;
  String? stdProfImportStatus;
  String? stdEligibilityStatUpdatedBy;
  String? stdEligibilityStatUpdatedAt;
  String? stdRegCreatedAt;
  String? stdAdmType;
  String? slab;
  String? whatsappNo;
  String? contactEmail;
  String? stdRegUpdtdAt;
  String? stdRollNoCrtdAt;
  String? stdidtest;
  String? remSts;
  String? stdDocPhyFinalVerStatus;
  String? stdEnrlSts;
  String? stdEnrlStsReason;
  String? remStsBtech;
  String? stdRegHstlUpdtdAt;
  String? stdLoginStatus;
  String? apiData;
  String? medicalFormSub;
  String? stdRegGenId;
  String? genStdNm;
  String? genStdEml;
  String? genStdMble;
  String? genStdDob;
  String? genStdAltEml;
  String? genStdAltMble;
  String? genStdGndr;
  String? genStdWhatsaap;
  String? genCreatedAt;
  String? genUpdatedAt;
  String? genUpdtdBy;
  String? bchNm;
  String? deptId;
  String? acdYrId;
  String? bchSts;
  String? stdNm;
  String? stdEml;
  String? stdMble;
  String? stdDob;
  String? stdAltEml;
  String? stdAltMble;
  String? stdCreatedAt;
  String? stsSts;
  String? stdGndr;
  String? stdWhatsaap;
  String? stdNm1;
  String? pgmNm;
  String? dispPgmNm;
  String? fcltyId;
  String? pgmTypId;
  String? pgmSts;
  String? pgmCode;
  String? pgmDurYear;
  String? pgmSemCount;
  String? pgmCodeAct;
  String? splznNm;
  String? splznSts;
  String? splznCode;
  String? splznRollCode;

  ProfileInfo(
      {this.splznId,
      this.pgmId,
      this.stdId,
      this.bchId,
      this.stdRegId,
      this.enrlYrId,
      this.hrmsSchId,
      this.stdType,
      this.rollNo,
      this.applicationNo,
      this.referenceNo,
      this.aoapPgmId,
      this.aoapSplznId,
      this.otherAppNo,
      this.otherDesc,
      this.studentRegDate,
      this.stdDocVerFinalStatus,
      this.stdProfVerFinalStatus,
      this.stdEligibilityStat,
      this.appRegId,
      this.stdNameVerifyStatus,
      this.stdDobVerifyStatus,
      this.pgmIdAdmn,
      this.splznIdAdmn,
      this.stdProfImportStatus,
      this.stdEligibilityStatUpdatedBy,
      this.stdEligibilityStatUpdatedAt,
      this.stdRegCreatedAt,
      this.stdAdmType,
      this.slab,
      this.whatsappNo,
      this.contactEmail,
      this.stdRegUpdtdAt,
      this.stdRollNoCrtdAt,
      this.stdidtest,
      this.remSts,
      this.stdDocPhyFinalVerStatus,
      this.stdEnrlSts,
      this.stdEnrlStsReason,
      this.remStsBtech,
      this.stdRegHstlUpdtdAt,
      this.stdLoginStatus,
      this.apiData,
      this.medicalFormSub,
      this.stdRegGenId,
      this.genStdNm,
      this.genStdEml,
      this.genStdMble,
      this.genStdDob,
      this.genStdAltEml,
      this.genStdAltMble,
      this.genStdGndr,
      this.genStdWhatsaap,
      this.genCreatedAt,
      this.genUpdatedAt,
      this.genUpdtdBy,
      this.bchNm,
      this.deptId,
      this.acdYrId,
      this.bchSts,
      this.stdNm,
      this.stdEml,
      this.stdMble,
      this.stdDob,
      this.stdAltEml,
      this.stdAltMble,
      this.stdCreatedAt,
      this.stsSts,
      this.stdGndr,
      this.stdWhatsaap,
      this.stdNm1,
      this.pgmNm,
      this.dispPgmNm,
      this.fcltyId,
      this.pgmTypId,
      this.pgmSts,
      this.pgmCode,
      this.pgmDurYear,
      this.pgmSemCount,
      this.pgmCodeAct,
      this.splznNm,
      this.splznSts,
      this.splznCode,
      this.splznRollCode});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    splznId = json['splzn_id'];
    pgmId = json['pgm_id'];
    stdId = json['std_id'];
    bchId = json['bch_id'];
    stdRegId = json['std_reg_id'];
    enrlYrId = json['enrl_yr_id'];
    hrmsSchId = json['hrms_sch_id'];
    stdType = json['std_type'];
    rollNo = json['roll_no'];
    applicationNo = json['application_no'];
    referenceNo = json['reference_no'];
    aoapPgmId = json['aoap_pgm_id'];
    aoapSplznId = json['aoap_splzn_id'];
    otherAppNo = json['other_app_no'];
    otherDesc = json['other_desc'];
    studentRegDate = json['student_reg_date'];
    stdDocVerFinalStatus = json['std_doc_ver_final_status'];
    stdProfVerFinalStatus = json['std_prof_ver_final_status'];
    stdEligibilityStat = json['std_eligibility_stat'];
    appRegId = json['app_reg_id'];
    stdNameVerifyStatus = json['std_name_verify_status'];
    stdDobVerifyStatus = json['std_dob_verify_status'];
    pgmIdAdmn = json['pgm_id_admn'];
    splznIdAdmn = json['splzn_id_admn'];
    stdProfImportStatus = json['std_prof_import_status'];
    stdEligibilityStatUpdatedBy = json['std_eligibility_stat_updated_by'];
    stdEligibilityStatUpdatedAt = json['std_eligibility_stat_updated_at'];
    stdRegCreatedAt = json['std_reg_created_at'];
    stdAdmType = json['std_adm_type'];
    slab = json['slab'];
    whatsappNo = json['whatsapp_no'];
    contactEmail = json['contact_email'];
    stdRegUpdtdAt = json['std_reg_updtd_at'];
    stdRollNoCrtdAt = json['std_roll_no_crtd_at'];
    stdidtest = json['stdidtest'];
    remSts = json['rem_sts'];
    stdDocPhyFinalVerStatus = json['std_doc_phy_final_ver_status'];
    stdEnrlSts = json['std_enrl_sts'];
    stdEnrlStsReason = json['std_enrl_sts_reason'];
    remStsBtech = json['rem_sts_btech'];
    stdRegHstlUpdtdAt = json['std_reg_hstl_updtd_at'];
    stdLoginStatus = json['std_login_status'];
    apiData = json['api_data'];
    medicalFormSub = json['medical_form_sub'];
    stdRegGenId = json['std_reg_gen_id'];
    genStdNm = json['gen_std_nm'];
    genStdEml = json['gen_std_eml'];
    genStdMble = json['gen_std_mble'];
    genStdDob = json['gen_std_dob'];
    genStdAltEml = json['gen_std_alt_eml'];
    genStdAltMble = json['gen_std_alt_mble'];
    genStdGndr = json['gen_std_gndr'];
    genStdWhatsaap = json['gen_std_whatsaap'];
    genCreatedAt = json['gen_created_at'];
    genUpdatedAt = json['gen_updated_at'];
    genUpdtdBy = json['gen_updtd_by'];
    bchNm = json['bch_nm'];
    deptId = json['dept_id'];
    acdYrId = json['acd_yr_id'];
    bchSts = json['bch_sts'];
    stdNm = json['std_nm'];
    stdEml = json['std_eml'];
    stdMble = json['std_mble'];
    stdDob = json['std_dob'];
    stdAltEml = json['std_alt_eml'];
    stdAltMble = json['std_alt_mble'];
    stdCreatedAt = json['std_created_at'];
    stsSts = json['sts_sts'];
    stdGndr = json['std_gndr'];
    stdWhatsaap = json['std_whatsaap'];
    stdNm1 = json['std_nm1'];
    pgmNm = json['pgm_nm'];
    dispPgmNm = json['disp_pgm_nm'];
    fcltyId = json['fclty_id'];
    pgmTypId = json['pgm_typ_id'];
    pgmSts = json['pgm_sts'];
    pgmCode = json['pgm_code'];
    pgmDurYear = json['pgm_dur_year'];
    pgmSemCount = json['pgm_sem_count'];
    pgmCodeAct = json['pgm_code_act'];
    splznNm = json['splzn_nm'];
    splznSts = json['splzn_sts'];
    splznCode = json['splzn_code'];
    splznRollCode = json['splzn_roll_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['splzn_id'] = this.splznId;
    data['pgm_id'] = this.pgmId;
    data['std_id'] = this.stdId;
    data['bch_id'] = this.bchId;
    data['std_reg_id'] = this.stdRegId;
    data['enrl_yr_id'] = this.enrlYrId;
    data['hrms_sch_id'] = this.hrmsSchId;
    data['std_type'] = this.stdType;
    data['roll_no'] = this.rollNo;
    data['application_no'] = this.applicationNo;
    data['reference_no'] = this.referenceNo;
    data['aoap_pgm_id'] = this.aoapPgmId;
    data['aoap_splzn_id'] = this.aoapSplznId;
    data['other_app_no'] = this.otherAppNo;
    data['other_desc'] = this.otherDesc;
    data['student_reg_date'] = this.studentRegDate;
    data['std_doc_ver_final_status'] = this.stdDocVerFinalStatus;
    data['std_prof_ver_final_status'] = this.stdProfVerFinalStatus;
    data['std_eligibility_stat'] = this.stdEligibilityStat;
    data['app_reg_id'] = this.appRegId;
    data['std_name_verify_status'] = this.stdNameVerifyStatus;
    data['std_dob_verify_status'] = this.stdDobVerifyStatus;
    data['pgm_id_admn'] = this.pgmIdAdmn;
    data['splzn_id_admn'] = this.splznIdAdmn;
    data['std_prof_import_status'] = this.stdProfImportStatus;
    data['std_eligibility_stat_updated_by'] = this.stdEligibilityStatUpdatedBy;
    data['std_eligibility_stat_updated_at'] = this.stdEligibilityStatUpdatedAt;
    data['std_reg_created_at'] = this.stdRegCreatedAt;
    data['std_adm_type'] = this.stdAdmType;
    data['slab'] = this.slab;
    data['whatsapp_no'] = this.whatsappNo;
    data['contact_email'] = this.contactEmail;
    data['std_reg_updtd_at'] = this.stdRegUpdtdAt;
    data['std_roll_no_crtd_at'] = this.stdRollNoCrtdAt;
    data['stdidtest'] = this.stdidtest;
    data['rem_sts'] = this.remSts;
    data['std_doc_phy_final_ver_status'] = this.stdDocPhyFinalVerStatus;
    data['std_enrl_sts'] = this.stdEnrlSts;
    data['std_enrl_sts_reason'] = this.stdEnrlStsReason;
    data['rem_sts_btech'] = this.remStsBtech;
    data['std_reg_hstl_updtd_at'] = this.stdRegHstlUpdtdAt;
    data['std_login_status'] = this.stdLoginStatus;
    data['api_data'] = this.apiData;
    data['medical_form_sub'] = this.medicalFormSub;
    data['std_reg_gen_id'] = this.stdRegGenId;
    data['gen_std_nm'] = this.genStdNm;
    data['gen_std_eml'] = this.genStdEml;
    data['gen_std_mble'] = this.genStdMble;
    data['gen_std_dob'] = this.genStdDob;
    data['gen_std_alt_eml'] = this.genStdAltEml;
    data['gen_std_alt_mble'] = this.genStdAltMble;
    data['gen_std_gndr'] = this.genStdGndr;
    data['gen_std_whatsaap'] = this.genStdWhatsaap;
    data['gen_created_at'] = this.genCreatedAt;
    data['gen_updated_at'] = this.genUpdatedAt;
    data['gen_updtd_by'] = this.genUpdtdBy;
    data['bch_nm'] = this.bchNm;
    data['dept_id'] = this.deptId;
    data['acd_yr_id'] = this.acdYrId;
    data['bch_sts'] = this.bchSts;
    data['std_nm'] = this.stdNm;
    data['std_eml'] = this.stdEml;
    data['std_mble'] = this.stdMble;
    data['std_dob'] = this.stdDob;
    data['std_alt_eml'] = this.stdAltEml;
    data['std_alt_mble'] = this.stdAltMble;
    data['std_created_at'] = this.stdCreatedAt;
    data['sts_sts'] = this.stsSts;
    data['std_gndr'] = this.stdGndr;
    data['std_whatsaap'] = this.stdWhatsaap;
    data['std_nm1'] = this.stdNm1;
    data['pgm_nm'] = this.pgmNm;
    data['disp_pgm_nm'] = this.dispPgmNm;
    data['fclty_id'] = this.fcltyId;
    data['pgm_typ_id'] = this.pgmTypId;
    data['pgm_sts'] = this.pgmSts;
    data['pgm_code'] = this.pgmCode;
    data['pgm_dur_year'] = this.pgmDurYear;
    data['pgm_sem_count'] = this.pgmSemCount;
    data['pgm_code_act'] = this.pgmCodeAct;
    data['splzn_nm'] = this.splznNm;
    data['splzn_sts'] = this.splznSts;
    data['splzn_code'] = this.splznCode;
    data['splzn_roll_code'] = this.splznRollCode;
    return data;
  }
}

class CanInfo {
  String? stdCanId;
  String? applicationNo;
  String? canNumber;
  String? campusInductionDate;

  CanInfo(
      {this.stdCanId,
      this.applicationNo,
      this.canNumber,
      this.campusInductionDate});

  CanInfo.fromJson(Map<String, dynamic> json) {
    stdCanId = json['std_can_id'];
    applicationNo = json['application_no'];
    canNumber = json['can_number'];
    campusInductionDate = json['campus_induction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['std_can_id'] = this.stdCanId;
    data['application_no'] = this.applicationNo;
    data['can_number'] = this.canNumber;
    data['campus_induction_date'] = this.campusInductionDate;
    return data;
  }
}

class HostelInfo {
  String? stdRegId;
  String? roomId;
  String? hostReqDate;
  String? fnlPaid;
  String? fnlPaidOn;
  String? hostelBy;
  String? hostelOn;
  String? hostelUpdatedAt;

  HostelInfo(
      {this.stdRegId,
      this.roomId,
      this.hostReqDate,
      this.fnlPaid,
      this.fnlPaidOn,
      this.hostelBy,
      this.hostelOn,
      this.hostelUpdatedAt});

  HostelInfo.fromJson(Map<String, dynamic> json) {
    stdRegId = json['std_reg_id'];
    roomId = json['room_id'];
    hostReqDate = json['host_req_date'];
    fnlPaid = json['fnl_paid'];
    fnlPaidOn = json['fnl_paid_on'];
    hostelBy = json['hostel_by'];
    hostelOn = json['hostel_on'];
    hostelUpdatedAt = json['hostel_updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['std_reg_id'] = this.stdRegId;
    data['room_id'] = this.roomId;
    data['host_req_date'] = this.hostReqDate;
    data['fnl_paid'] = this.fnlPaid;
    data['fnl_paid_on'] = this.fnlPaidOn;
    data['hostel_by'] = this.hostelBy;
    data['hostel_on'] = this.hostelOn;
    data['hostel_updated_at'] = this.hostelUpdatedAt;
    return data;
  }
}

class BusInfo {
  String? stdRegId;
  String? rtNm;
  String? brdngPnt;
  String? busFeeId;
  String? payDt;
  String? busCrtdAt;
  String? busBy;
  String? busOn;
  String? busBptId;

  BusInfo(
      {this.stdRegId,
      this.rtNm,
      this.brdngPnt,
      this.busFeeId,
      this.payDt,
      this.busCrtdAt,
      this.busBy,
      this.busOn,
      this.busBptId});

  BusInfo.fromJson(Map<String, dynamic> json) {
    stdRegId = json['std_reg_id'];
    rtNm = json['rt_nm'];
    brdngPnt = json['brdng_pnt'];
    busFeeId = json['bus_fee_id'];
    payDt = json['pay_dt'];
    busCrtdAt = json['bus_crtd_at'];
    busBy = json['bus_by'];
    busOn = json['bus_on'];
    busBptId = json['bus_bpt_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['std_reg_id'] = this.stdRegId;
    data['rt_nm'] = this.rtNm;
    data['brdng_pnt'] = this.brdngPnt;
    data['bus_fee_id'] = this.busFeeId;
    data['pay_dt'] = this.payDt;
    data['bus_crtd_at'] = this.busCrtdAt;
    data['bus_by'] = this.busBy;
    data['bus_on'] = this.busOn;
    data['bus_bpt_id'] = this.busBptId;
    return data;
  }

}
class AddditionalInfo {
  String? addtnlId;
  String? stdRegId;
  String? noOfAccompany;
  String? reportingType;
  String? inTime;
  String? outTime;
  String? updatedAt;
  String? createdAt;
  String? hostelArrivalDate;
  String? campusArrivalDate;
  String? pdfDownloaded;
  String? pdfDownloadedAt;
  String? gateVerifyStatus;
  String? gateVerifiedOn;
  String? documentVerifyStatus;
  String? documentVerifiedOn;
  String? hostelCheckStatus;
  String? hostelCheckInBy;
  String? hostelCheckInDate;
  String? comingBy;
  String? personalCarNo;

  AddditionalInfo(
      {this.addtnlId,
      this.stdRegId,
      this.noOfAccompany,
      this.reportingType,
      this.inTime,
      this.outTime,
      this.updatedAt,
      this.createdAt,
      this.hostelArrivalDate,
      this.campusArrivalDate,
      this.pdfDownloaded,
      this.pdfDownloadedAt,
      this.gateVerifyStatus,
      this.gateVerifiedOn,
      this.documentVerifyStatus,
      this.documentVerifiedOn,
      this.hostelCheckStatus,
      this.hostelCheckInBy,
      this.hostelCheckInDate,
      this.comingBy,
      this.personalCarNo});

  AddditionalInfo.fromJson(Map<String, dynamic> json) {
    addtnlId = json['addtnl_id'];
    stdRegId = json['std_reg_id'];
    noOfAccompany = json['no_of_accompany'];
    reportingType = json['reporting_type'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    hostelArrivalDate = json['hostel_arrival_date'];
    campusArrivalDate = json['campus_arrival_date'];
    pdfDownloaded = json['pdf_downloaded'];
    pdfDownloadedAt = json['pdf_downloaded_at'];
    gateVerifyStatus = json['gate_verify_status'];
    gateVerifiedOn = json['gate_verified_on'];
    documentVerifyStatus = json['document_verify_status'];
    documentVerifiedOn = json['document_verified_on'];
    hostelCheckStatus = json['hostel_check_status'];
    hostelCheckInBy = json['hostel_check_in_by'];
    hostelCheckInDate = json['hostel_check_in_date'];
    comingBy = json['coming_by'];
    personalCarNo = json['personal_car_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addtnl_id'] = this.addtnlId;
    data['std_reg_id'] = this.stdRegId;
    data['no_of_accompany'] = this.noOfAccompany;
    data['reporting_type'] = this.reportingType;
    data['in_time'] = this.inTime;
    data['out_time'] = this.outTime;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['hostel_arrival_date'] = this.hostelArrivalDate;
    data['campus_arrival_date'] = this.campusArrivalDate;
    data['pdf_downloaded'] = this.pdfDownloaded;
    data['pdf_downloaded_at'] = this.pdfDownloadedAt;
    data['gate_verify_status'] = this.gateVerifyStatus;
    data['gate_verified_on'] = this.gateVerifiedOn;
    data['document_verify_status'] = this.documentVerifyStatus;
    data['document_verified_on'] = this.documentVerifiedOn;
    data['hostel_check_status'] = this.hostelCheckStatus;
    data['hostel_check_in_by'] = this.hostelCheckInBy;
    data['hostel_check_in_date'] = this.hostelCheckInDate;
    data['coming_by'] = this.comingBy;
    data['personal_car_no'] = this.personalCarNo;
    return data;
  }
}
