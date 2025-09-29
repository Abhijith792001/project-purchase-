class IndentModel  {
  String? indentId;
  String? indentType;
  String? requesterName;
  String? indentStatus;
  String? dateOfIndent;
  String? deptLab;
  double? netTotal;  // <-- change here

  IndentModel (
      {this.indentId,
      this.indentType,
      this.requesterName,
      this.indentStatus,
      this.dateOfIndent,
      this.deptLab,
      this.netTotal});

  IndentModel .fromJson(Map<String, dynamic> json) {
    indentId = json['indent_id'];
    indentType = json['indent_type'];
    requesterName = json['requester_name'];
    indentStatus = json['indent_status'];
    dateOfIndent = json['date_of_indent'];
    deptLab = json['dept_lab'];
    netTotal = (json['net_total'] as num?)?.toDouble();  // <-- safely convert to double
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['indent_id'] = indentId;
    data['indent_type'] = indentType;
    data['requester_name'] = requesterName;
    data['indent_status'] = indentStatus;
    data['date_of_indent'] = dateOfIndent;
    data['dept_lab'] = deptLab;
    data['net_total'] = netTotal;
    return data;
  }
}
