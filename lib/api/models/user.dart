class UserData {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  String branchCode;
  String fullNameTh;
  String sex;
  String branchEn;
  String roleCode;
  String roleEn;
  String fullName;
  String branchTh;
  String userId;
  String roleTh;
  String jti;

  UserData(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope,
      this.branchCode,
      this.fullNameTh,
      this.sex,
      this.branchEn,
      this.roleCode,
      this.roleEn,
      this.fullName,
      this.branchTh,
      this.userId,
      this.roleTh,
      this.jti});

  UserData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    branchCode = json['branchCode'];
    fullNameTh = json['fullNameTh'];
    sex = json['sex'];
    branchEn = json['branchEn'];
    roleCode = json['roleCode'];
    roleEn = json['roleEn'];
    fullName = json['fullName'];
    branchTh = json['branchTh'];
    userId = json['userId'];
    roleTh = json['roleTh'];
    jti = json['jti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    data['branchCode'] = this.branchCode;
    data['fullNameTh'] = this.fullNameTh;
    data['sex'] = this.sex;
    data['branchEn'] = this.branchEn;
    data['roleCode'] = this.roleCode;
    data['roleEn'] = this.roleEn;
    data['fullName'] = this.fullName;
    data['branchTh'] = this.branchTh;
    data['userId'] = this.userId;
    data['roleTh'] = this.roleTh;
    data['jti'] = this.jti;
    return data;
  }
}
