//
// class LoginResponse {
//   int ?status;
//   int ?statusCode;
//   String ?message;
//
//   LoginResponse({this.status, this.statusCode, this.message});
//
//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['statusCode'] = statusCode;
//     data['message'] = message;
//     return data;
//   }
// }
class LoginResponseDone {
  int ?status;
  int ?statusCode;
  String ?message;
  Data ?data;

  LoginResponseDone({this.status, this.statusCode, this.data,this.message});

  LoginResponseDone.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String ?appToken;
  UserData ?userData;
  List<void>? attendanceData;
  BasicInfo ?basicInfo;

  Data({this.appToken, this.userData, this.attendanceData, this.basicInfo});

  Data.fromJson(Map<String, dynamic> json) {
    appToken = json['app_token'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    // if (json['attendance_data'] != null) {
    //   attendanceData = new List<Null>();
    //   json['attendance_data'].forEach((v) {
    //     attendanceData.add(fromJson(v));
    //   });
    // }
    basicInfo = json['basic_info'] != null
        ? new BasicInfo.fromJson(json['basic_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_token'] = this.appToken;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    // if (this.attendanceData != null) {
    //   data['attendance_data'] =
    //       this.attendanceData.map((v) => v.toJson()).toList();
    // }
    if (this.basicInfo != null) {
      data['basic_info'] = this.basicInfo!.toJson();
    }
    return data;
  }
}

class UserData {
  int? userId;
  int ?employeeId;
  int ?biometricId;
  int ?officeShiftId;
  int ?teamHeadId;
  String? firstName;
  String ?lastName;
  String ?username;
  String ?email;
  String ?password;
  int ?tempPass;
  String? dateOfBirth;
  String ?gender;
  int ?eStatus;
  int ?userRoleId;
  int ?outsourcing;
  int ?departmentId;
  int ?subDepartmentId;
  int ?designationId;
  int ?companyId;
  int ?locationId;
  int ?viewCompaniesId;
  String? salaryTemplate;
  int? hourlyGradeId;
  int ?monthlyGradeId;
  String? dateOfJoining;
  String ?dateOfLeaving;
  String ?maritalStatus;
  String ?salary;
  int ?wagesType;
  int ?gradeId;
  int ?basicSalary;
  int ?currentCtc;
  int ?pfStatus;
  int ?pfBasic;
  String? pfNumber;
  int ?dailyWages;
  int ?salarySsempee;
  int ?salarySsempeer;
  int ?salaryIncomeTax;
  int ?salaryOvertime;
  int ?salaryCommission;
  int ?salaryClaims;
  int ?salaryPaidLeave;
  int ?salaryDirectorFees;
  int ?salaryBonus;
  int ?salaryAdvancePaid;
  String? address;
  String ?state;
  String ?city;
  int ?zipcode;
  String? profilePicture;
  String? profileBackground;
  Null ?trackerBackgroundImg;
  String? resume;
  String ?skypeId;
  int ?contactNo;
  String? facebookLink;
  String ?twitterLink;
  String ?bloggerLink;
  String ?linkdedinLink;
  String ?googlePlusLink;
  String ?instagramLink;
  String ?pinterestLink;
  String ?youtubeLink;
  int? isActive;
  String? lastLoginDate;
  String ?lastLogoutDate;
  String ?lastLoginIp;
  int ?isLoggedIn;
  int ?onlineStatus;
  String ?fixedHeader;
  String ?compactSidebar;
  String ?boxedWrapper;
  String ?leaveCategories;
  String ?leaveStartMonth;
  String ?createdAt;
  String ?officeShiftName;
  String ?teamHeadName;
  String ?userRoleName;
  String ?departmentName;
  String ?designationName;
  String ?companyName;
  String ?locationName;
  String ?gradeName;

  UserData(
      {this.userId,
        this.employeeId,
        this.biometricId,
        this.officeShiftId,
        this.teamHeadId,
        this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.password,
        this.tempPass,
        this.dateOfBirth,
        this.gender,
        this.eStatus,
        this.userRoleId,
        this.outsourcing,
        this.departmentId,
        this.subDepartmentId,
        this.designationId,
        this.companyId,
        this.locationId,
        this.viewCompaniesId,
        this.salaryTemplate,
        this.hourlyGradeId,
        this.monthlyGradeId,
        this.dateOfJoining,
        this.dateOfLeaving,
        this.maritalStatus,
        this.salary,
        this.wagesType,
        this.gradeId,
        this.basicSalary,
        this.currentCtc,
        this.pfStatus,
        this.pfBasic,
        this.pfNumber,
        this.dailyWages,
        this.salarySsempee,
        this.salarySsempeer,
        this.salaryIncomeTax,
        this.salaryOvertime,
        this.salaryCommission,
        this.salaryClaims,
        this.salaryPaidLeave,
        this.salaryDirectorFees,
        this.salaryBonus,
        this.salaryAdvancePaid,
        this.address,
        this.state,
        this.city,
        this.zipcode,
        this.profilePicture,
        this.profileBackground,
        this.trackerBackgroundImg,
        this.resume,
        this.skypeId,
        this.contactNo,
        this.facebookLink,
        this.twitterLink,
        this.bloggerLink,
        this.linkdedinLink,
        this.googlePlusLink,
        this.instagramLink,
        this.pinterestLink,
        this.youtubeLink,
        this.isActive,
        this.lastLoginDate,
        this.lastLogoutDate,
        this.lastLoginIp,
        this.isLoggedIn,
        this.onlineStatus,
        this.fixedHeader,
        this.compactSidebar,
        this.boxedWrapper,
        this.leaveCategories,
        this.leaveStartMonth,
        this.createdAt,
        this.officeShiftName,
        this.teamHeadName,
        this.userRoleName,
        this.departmentName,
        this.designationName,
        this.companyName,
        this.locationName,
        this.gradeName});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employeeId = json['employee_id'];
    biometricId = json['biometric_id'];
    officeShiftId = json['office_shift_id'];
    teamHeadId = json['team_head_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    tempPass = json['temp_pass'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    eStatus = json['e_status'];
    userRoleId = json['user_role_id'];
    outsourcing = json['outsourcing'];
    departmentId = json['department_id'];
    subDepartmentId = json['sub_department_id'];
    designationId = json['designation_id'];
    companyId = json['company_id'];
    locationId = json['location_id'];
    viewCompaniesId = json['view_companies_id'];
    salaryTemplate = json['salary_template'];
    hourlyGradeId = json['hourly_grade_id'];
    monthlyGradeId = json['monthly_grade_id'];
    dateOfJoining = json['date_of_joining'];
    dateOfLeaving = json['date_of_leaving'];
    maritalStatus = json['marital_status'];
    salary = json['salary'];
    wagesType = json['wages_type'];
    gradeId = json['grade_id'];
    basicSalary = json['basic_salary'];
    currentCtc = json['current_ctc'];
    pfStatus = json['pf_status'];
    pfBasic = json['pf_basic'];
    pfNumber = json['pf_number'];
    dailyWages = json['daily_wages'];
    salarySsempee = json['salary_ssempee'];
    salarySsempeer = json['salary_ssempeer'];
    salaryIncomeTax = json['salary_income_tax'];
    salaryOvertime = json['salary_overtime'];
    salaryCommission = json['salary_commission'];
    salaryClaims = json['salary_claims'];
    salaryPaidLeave = json['salary_paid_leave'];
    salaryDirectorFees = json['salary_director_fees'];
    salaryBonus = json['salary_bonus'];
    salaryAdvancePaid = json['salary_advance_paid'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    profilePicture = json['profile_picture'];
    profileBackground = json['profile_background'];
    trackerBackgroundImg = json['tracker_background_img'];
    resume = json['resume'];
    skypeId = json['skype_id'];
    contactNo = json['contact_no'];
    facebookLink = json['facebook_link'];
    twitterLink = json['twitter_link'];
    bloggerLink = json['blogger_link'];
    linkdedinLink = json['linkdedin_link'];
    googlePlusLink = json['google_plus_link'];
    instagramLink = json['instagram_link'];
    pinterestLink = json['pinterest_link'];
    youtubeLink = json['youtube_link'];
    isActive = json['is_active'];
    lastLoginDate = json['last_login_date'];
    lastLogoutDate = json['last_logout_date'];
    lastLoginIp = json['last_login_ip'];
    isLoggedIn = json['is_logged_in'];
    onlineStatus = json['online_status'];
    fixedHeader = json['fixed_header'];
    compactSidebar = json['compact_sidebar'];
    boxedWrapper = json['boxed_wrapper'];
    leaveCategories = json['leave_categories'];
    leaveStartMonth = json['leave_start_month'];
    createdAt = json['created_at'];
    officeShiftName = json['office_shift_name'];
    teamHeadName = json['team_head_name'];
    userRoleName = json['user_role_name'];
    departmentName = json['department_name'];
    designationName = json['designation_name'];
    companyName = json['company_name'];
    locationName = json['location_name'];
    gradeName = json['grade_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['biometric_id'] = this.biometricId;
    data['office_shift_id'] = this.officeShiftId;
    data['team_head_id'] = this.teamHeadId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['temp_pass'] = this.tempPass;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['e_status'] = this.eStatus;
    data['user_role_id'] = this.userRoleId;
    data['outsourcing'] = this.outsourcing;
    data['department_id'] = this.departmentId;
    data['sub_department_id'] = this.subDepartmentId;
    data['designation_id'] = this.designationId;
    data['company_id'] = this.companyId;
    data['location_id'] = this.locationId;
    data['view_companies_id'] = this.viewCompaniesId;
    data['salary_template'] = this.salaryTemplate;
    data['hourly_grade_id'] = this.hourlyGradeId;
    data['monthly_grade_id'] = this.monthlyGradeId;
    data['date_of_joining'] = this.dateOfJoining;
    data['date_of_leaving'] = this.dateOfLeaving;
    data['marital_status'] = this.maritalStatus;
    data['salary'] = this.salary;
    data['wages_type'] = this.wagesType;
    data['grade_id'] = this.gradeId;
    data['basic_salary'] = this.basicSalary;
    data['current_ctc'] = this.currentCtc;
    data['pf_status'] = this.pfStatus;
    data['pf_basic'] = this.pfBasic;
    data['pf_number'] = this.pfNumber;
    data['daily_wages'] = this.dailyWages;
    data['salary_ssempee'] = this.salarySsempee;
    data['salary_ssempeer'] = this.salarySsempeer;
    data['salary_income_tax'] = this.salaryIncomeTax;
    data['salary_overtime'] = this.salaryOvertime;
    data['salary_commission'] = this.salaryCommission;
    data['salary_claims'] = this.salaryClaims;
    data['salary_paid_leave'] = this.salaryPaidLeave;
    data['salary_director_fees'] = this.salaryDirectorFees;
    data['salary_bonus'] = this.salaryBonus;
    data['salary_advance_paid'] = this.salaryAdvancePaid;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['profile_picture'] = this.profilePicture;
    data['profile_background'] = this.profileBackground;
    data['tracker_background_img'] = this.trackerBackgroundImg;
    data['resume'] = this.resume;
    data['skype_id'] = this.skypeId;
    data['contact_no'] = this.contactNo;
    data['facebook_link'] = this.facebookLink;
    data['twitter_link'] = this.twitterLink;
    data['blogger_link'] = this.bloggerLink;
    data['linkdedin_link'] = this.linkdedinLink;
    data['google_plus_link'] = this.googlePlusLink;
    data['instagram_link'] = this.instagramLink;
    data['pinterest_link'] = this.pinterestLink;
    data['youtube_link'] = this.youtubeLink;
    data['is_active'] = this.isActive;
    data['last_login_date'] = this.lastLoginDate;
    data['last_logout_date'] = this.lastLogoutDate;
    data['last_login_ip'] = this.lastLoginIp;
    data['is_logged_in'] = this.isLoggedIn;
    data['online_status'] = this.onlineStatus;
    data['fixed_header'] = this.fixedHeader;
    data['compact_sidebar'] = this.compactSidebar;
    data['boxed_wrapper'] = this.boxedWrapper;
    data['leave_categories'] = this.leaveCategories;
    data['leave_start_month'] = this.leaveStartMonth;
    data['created_at'] = this.createdAt;
    data['office_shift_name'] = this.officeShiftName;
    data['team_head_name'] = this.teamHeadName;
    data['user_role_name'] = this.userRoleName;
    data['department_name'] = this.departmentName;
    data['designation_name'] = this.designationName;
    data['company_name'] = this.companyName;
    data['location_name'] = this.locationName;
    data['grade_name'] = this.gradeName;
    return data;
  }
}

class BasicInfo {
  int ? employeeId;
  String? firstName;
  String ?lastName;
  String ?email;
  String ?dateOfBirth;
  String ?gender;
  String ?maritalStatus;
  int ?contactNo;
  String ?address;
  String ?profilePicture;
  int ?designationId;
  String? designationName;
  int ?teamHeadId;
  String ?teamHeadName;

  BasicInfo(
      {this.employeeId,
        this.firstName,
        this.lastName,
        this.email,
        this.dateOfBirth,
        this.gender,
        this.maritalStatus,
        this.contactNo,
        this.address,
        this.profilePicture,
        this.designationId,
        this.designationName,
        this.teamHeadId,
        this.teamHeadName});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    contactNo = json['contact_no'];
    address = json['address'];
    profilePicture = json['profile_picture'];
    designationId = json['designation_id'];
    designationName = json['designation_name'];
    teamHeadId = json['team_head_id'];
    teamHeadName = json['team_head_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['contact_no'] = this.contactNo;
    data['address'] = this.address;
    data['profile_picture'] = this.profilePicture;
    data['designation_id'] = this.designationId;
    data['designation_name'] = this.designationName;
    data['team_head_id'] = this.teamHeadId;
    data['team_head_name'] = this.teamHeadName;
    return data;
  }
}