import 'BaseLanguage.dart';

class LanguageKo extends BaseLanguage {
  @override String get appName => '강력한 운전자';
  @override String get thisFieldRequired => '이 필드가 필요합니다';
  @override String get email => '이메일';
  @override String get password => '비밀번호';
  @override String get forgotPassword => '비밀번호를 잊으 셨나요?';
  @override String get logIn => '로그인';
  @override String get orLogInWith => '또는 로그인';
  @override String get donHaveAnAccount => '계정이 없습니까?';
  @override String get signUp => '가입하기';
  @override String get firstName => '이름';
  @override String get lastName => '성';
  @override String get userName => '사용자 이름';
  @override String get phoneNumber => '전화 번호';
  @override String get changePassword => '비밀번호를 변경하십시오';
  @override String get oldPassword => '기존 비밀번호';
  @override String get newPassword => '새 비밀번호';
  @override String get confirmPassword => '비밀번호 확인';
  @override String get passwordDoesNotMatch => '비밀번호가 일치하지 않습니다';
  @override String get passwordInvalid => '최소 비밀번호 길이는 8 여야합니다';
  @override String get yes => '예';
  @override String get no => '아니요';
  @override String get writeMessage => '메시지 작성 ....';
  @override String get enterTheEmailAssociatedWithYourAccount => '계정과 관련된 이메일을 입력하십시오';
  @override String get submit => '제출하다';
  @override String get language => '언어';
  @override String get notification => '공고';
  @override String get useInCaseOfEmergency => '응급 상황에 따라 사용하십시오';
  @override String get notifyAdmin => '관리자에게 알리십시오';
  @override String get notifiedSuccessfully => '성공적으로 통지했습니다';
  @override String get complain => '불평하다';
  @override String get pleaseEnterSubject => '주제를 입력하십시오';
  @override String get writeDescription => '설명 작성 ....';
  @override String get saveComplain => '불만을 저장하십시오';
  @override String get address => '주소';
  @override String get updateProfile => '프로필 업데이트';
  @override String get notChangeUsername => '사용자 이름을 변경할 수 없습니다';
  @override String get notChangeEmail => '이메일 ID를 변경할 수 없습니다';
  @override String get profileUpdateMsg => '프로필이 성공적으로 업데이트되었습니다';
  @override String get emergencyContact => '긴급 연락처';
  @override String get areYouSureYouWantDeleteThisNumber => '이 번호를 삭제 하시겠습니까?';
  @override String get addContact => '주소록에 추가';
  @override String get save => '구하다';
  @override String get availableBalance => '사용 가능한 잔액';
  @override String get recentTransactions => '최근 거래';
  @override String get moneyDeposited => '입금 된 돈';
  @override String get addMoney => '돈을 추가하십시오';
  @override String get cancel => '취소';
  @override String get pleaseSelectAmount => '금액을 선택하십시오';
  @override String get amount => '양';
  @override String get confirm => '확인하다';
  @override String get wallet => '지갑';
  @override String get paymentDetail => '지불 세부 사항';
  @override String get rideId => '라이드 ID';
  @override String get viewHistory => '역사를 봅니다';
  @override String get paymentDetails => '지불 세부 사항';
  @override String get paymentType => '지불 유형';
  @override String get paymentStatus => '지불 상태';
  @override String get priceDetail => '가격 세부 사항';
  @override String get basePrice => '기본 가격';
  @override String get distancePrice => '원격 가격';
  @override String get waitTime => '기다리는 시간';
  @override String get extraCharges => '추가 요금';
  @override String get couponDiscount => '쿠폰 할인';
  @override String get total => '총';
  @override String get payment => '지불';
  @override String get cash => '현금';
  @override String get waitingForDriverConformation => '라이더가 형태를 기다리고 있습니다';
  @override String get tip => '팁';
  @override String get pay => '지불하다';
  @override String get howWasYourRide => '당신의 타는 것은 어땠어?';
  @override String get addReviews => '리뷰 추가';
  @override String get writeYourComments => '리뷰 작성 ....';
  @override String get continueD => '계속하다';
  @override String get detailScreen => '디테일을 타십시오';
  @override String get rideHistory => '타는 역사';
  @override String get emergencyContacts => '비상 연락처';
  @override String get logOut => '로그 아웃';
  @override String get areYouSureYouWantToLogoutThisApp => '이 앱을 로그 아웃 하시겠습니까?';
  @override String get destinationLocation => '목적지 위치';
  @override String get profile => '프로필';
  @override String get privacyPolicy => '개인 정보 정책';
  @override String get helpSupport => '도움 및 지원';
  @override String get termsConditions => '이용 약관';
  @override String get aboutUs => '우리에 대해';
  @override String get rides => '놀이기구';
  @override String get sendOTP => 'OTP를 보내십시오';
  @override String get carModel => '자동차 모델';
  @override String get sos => '위급 신호';
  @override String get signInUsingYourMobileNumber => '\ nmobile 번호를 사용하여 로그인하십시오';
  @override String get accepted => '받아 들여졌다';
  @override String get arriving => '도착';
  @override String get arrived => '도착했다';
  @override String get cancelled => '취소 된';
  @override String get completed => '완전한';
  @override String get pleaseEnableLocationPermission => '위치 권한을 활성화하십시오';
  @override String get pending => '보류 중';
  @override String get failed => '실패한';
  @override String get paid => '유급의';
  @override String get male => '남성';
  @override String get female => '여성';
  @override String get other => '다른';
  @override String get addExtraCharges => '추가 요금을 추가하십시오';
  @override String get enterAmount => '금액을 입력하세요';
  @override String get pleaseAddedAmount => '금액을 추가하십시오';
  @override String get title => '제목';
  @override String get charges => '요금';
  @override String get saveCharges => '요금을 저장하십시오';
  @override String get bankName => '은행 이름';
  @override String get bankCode => '은행 코드';
  @override String get accountHolderName => '계정 보유자 이름';
  @override String get accountNumber => '계좌 번호';
  @override String get updateBankDetail => '은행 세부 사항을 업데이트하십시오';
  @override String get addBankDetail => '은행 세부 사항을 추가하십시오';
  @override String get bankInfoUpdateSuccessfully => '은행 정보 업데이트가 성공적으로 업데이트됩니다';
  @override String get youAreOnlineNow => '당신은 지금 온라인입니다';
  @override String get youAreOfflineNow => '당신은 지금 오프라인입니다';
  @override String get requests => '요청';
  @override String get areYouSureYouWantToCancelThisRequest => '이 요청을 취소 하시겠습니까?';
  @override String get decline => '감소';
  @override String get accept => '수용하다';
  @override String get areYouSureYouWantToAcceptThisRequest => '이 요청을 수락 하시겠습니까?';
  @override String get call => '부르다';
  @override String get areYouSureYouWantToArriving => '도착 하시겠습니까?';
  @override String get areYouSureYouWantToArrived => '도착 하시겠습니까?';
  @override String get enterOtp => 'OTP를 입력하십시오';
  @override String get pleaseEnterValidOtp => '유효한 OTP를 입력하십시오';
  @override String get pleaseSelectService => '서비스를 선택하십시오';
  @override String get userDetail => '사용자 세부 사항';
  @override String get selectService => '서비스를 선택하십시오';
  @override String get carColor => '자동차 색';
  @override String get carPlateNumber => '자동차 플레이트 번호';
  @override String get carProductionYear => '자동차 생산 연도';
  @override String get withDraw => '철회하다';
  @override String get withdrawHistory => '역사를 철회하십시오';
  @override String get approved => '승인';
  @override String get requested => '요청';
  @override String get updateVehicle => '차량 업데이트';
  @override String get userNotApproveMsg => '프로필이 검토 중입니다. 시간을 기다리거나 관리자에게 연락하십시오.';
  @override String get uploadFileConfirmationMsg => '이 파일을 업로드 하시겠습니까?';
  @override String get selectDocument => '문서를 선택하십시오';
  @override String get addDocument => '문서 추가';
  @override String get areYouSureYouWantToDeleteThisDocument => '이 문서를 삭제 하시겠습니까?';
  @override String get expireDate => '날짜를 만료하십시오';
  @override String get goDashBoard => '대시 보드로 이동하십시오';
  @override String get deleteAccount => '계정 삭제';
  @override String get account => '계정';
  @override String get areYouSureYouWantPleaseReadAffect => '계정을 삭제 하시겠습니까? 계정 삭제가 어떻게 영향을 미치는지 읽으십시오.';
  @override String get deletingAccountEmail => '계정 삭제하면 데이터베이스에서 개인 정보가 제거됩니다. 귀하의 이메일은 영구적으로 예약되고 새 계정을 등록하기 위해 동일한 이메일을 재사용 할 수 없습니다.';
  @override String get areYouSureYouWantDeleteAccount => '계정을 삭제 하시겠습니까?';
  @override String get yourInternetIsNotWorking => '인터넷이 작동하지 않습니다';
  @override String get allow => '허용하다';
  @override String get mostReliableMightyDriverApp => '가장 신뢰할 수있는 강력한 드라이버 앱';
  @override String get toEnjoyYourRideExperiencePleaseAllowPermissions => '승차 경험을 즐기려면 다음과 같은 권한을 허용합니다.';
  @override String get cashCollected => '현금 수집';
  @override String get areYouSureCollectThisPayment => '이 지불금을 수집하고 있습니까?';
  @override String get txtURLEmpty => 'URL이 비어 있습니다';
  @override String get lblFollowUs => '우리를 따르십시오';
  @override String get bankInfo => '은행 정보';
  @override String get duration => '지속';
  @override String get moneyDebit => '돈 직불';
  @override String get vehicleInfo => '차량 정보';
  @override String get demoMsg => '테스터 역할은이 조치를 수행 할 수 없습니다';
  @override String get youCannotChangePhoneNumber => '전화 번호를 변경할 수 없습니다';
  @override String get offLine => '오프라인';
  @override String get online => '온라인';
  @override String get aboutRider => '라이더에 대해';
  @override String get pleaseEnterMessage => '메시지를 입력하십시오';
  @override String get pleaseSelectRating => '등급을 선택하십시오';
  @override String get serviceInfo => '서비스 정보';
  @override String get youCannotChangeService => '서비스를 변경할 수 없습니다';
  @override String get vehicleInfoUpdateSucessfully => '차량 정보 업데이트가 성공적으로 업데이트됩니다';
  @override String get isMandatoryDocument => '* 필수 문서입니다.';
  @override String get someRequiredDocumentAreNotUploaded => '필요한 문서는 업로드되지 않습니다. 필요한 모든 서류를 업로드하십시오.';
  @override String get areYouCertainOffline => '오프라인으로 가고 싶습니까?';
  @override String get areYouCertainOnline => '온라인으로 가고 싶습니까?';
  @override String get pleaseAcceptTermsOfServicePrivacyPolicy => '서비스 이용 약관 및 개인 정보 보호 정책을 수락하십시오';
  @override String get rememberMe => '날 기억해';
  @override String get agreeToThe => '나는 동의 함';
  @override String get invoice => '송장';
  @override String get riderInformation => '라이더 정보';
  @override String get customerName => '고객 이름';
  @override String get sourceLocation => '소스 위치';
  @override String get invoiceNo => '송장 번호';
  @override String get invoiceDate => '송장 날짜';
  @override String get orderedDate => '주문 날짜';
  @override String get totalEarning => '총 수익';
  @override String get pleaseSelectFromDateAndToDate => '날짜와 날짜부터 선택하십시오';
  @override String get fromDate => '날짜부터';
  @override String get toDate => '지금까지';
  @override String get ride => '타다';
  @override String get weeklyOrderCount => '주간 주문 수';
  @override String get distance => '거리';
  @override String get iAgreeToThe => '나는 동의 함';
  @override String get today => '오늘';
  @override String get weekly => '주간';
  @override String get report => '보고서';
  @override String get earning => '수입';
  @override String get todayEarning => '오늘 수입';
  @override String get available => '사용 가능';
  @override String get notAvailable => '사용 불가';
  @override String get youWillReceiveNewRidersAndNotifications => '새로운 라이더와 알림을 받게됩니다';
  @override String get youWillNotReceiveNewRidersAndNotifications => '새로운 라이더와 알림을받지 못할 것입니다';
  @override String get yourAccountIs => '귀하의 계정입니다';
  @override String get pleaseContactSystemAdministrator => '시스템 관리자에게 문의하십시오';
  @override String get youCanNotThisActionsPerformBecauseYourCurrentRideIsNotCompleted => '현재 승차가 완료되지 않기 때문에이 작업을 수행 할 수 없습니다.';
  @override String get applyExtraCharges => '추가 요금을 적용하십시오';
  @override String get pleaseSelectExtraCharges => '추가 요금을 선택하십시오';
  @override String get unsupportedPlatForm => '지원되지 않는 플랫폼';
  @override String get description => '설명';
  @override String get price => '가격';
  @override String get gallery => '갤러리';
  @override String get camera => '카메라';
  @override String get locationNotAvailable => '위치를 사용할 수 없습니다';
  @override String get bankInfoNotFound => '은행 정보를 찾을 수 없습니다';
  @override String get minimum => '최저한의';
  @override String get maximum => '최고';
  @override String get required => '필수의';
  @override String get paymentFailed => '결제 실패';
  @override String get checkConsoleForError => '콘솔을 확인하십시오';
  @override String get transactionFailed => '거래 실패';
  @override String get transactionSuccessful => '거래 성공';
  @override String get payWithCard => '카드로 지불하십시오';
  @override String get success => '성공';
  @override String get declined => '거절했다';
  @override String get endRide => '엔드 라이드';
  @override String get startRide => '타기 시작하십시오';
  @override String get invoiceCapital => '송장';
  @override String get validateOtp => 'OTP를 확인하십시오';
  @override String get otpCodeHasBeenSentTo => 'OTP 코드가 전송되었습니다';
  @override String get pleaseEnterOtp => '휴대폰 번호를 확인하려면 아래에 OTP를 입력하십시오.';
  @override String get selectSources => '소스를 선택하십시오';
  @override String get file => '파일';
  @override String get earnings => '수입';
  @override String get documents => '서류';
  @override String get settings => '설정';
  @override String get finishMsg => '타는 것이 끝났다고 확신합니까?';
  @override String get extraFees => '추가 수수료를 적용하십시오';
  @override String get skip => '건너뛰다';
  @override String get noteSelectFromDate => '참고 : 최신 정보를 선택하십시오';
  @override String get chatWithAdmin => '관리자와 채팅하십시오';
  @override String get startRideAskOTP => '타기 시작하려면 고객에게 OTP를 요청하십시오.';
  @override String get lessWalletAmountMsg => '지갑 균형이 한도 아래에 있기 때문에 탈 수 없습니다. 운전자 앱을 계속 사용하려면 지금 지갑에 돈을 추가하십시오.';
  @override String get via => '을 통해';
  @override String get status => '상태';
  @override String get minutePrice => '분 가격';
  @override String get waitingTimePrice => '대기 시간 가격';
  @override String get additionalFees => '추가 요금';
  @override String get minimumFees => '최소 수수료';
  @override String get tips => '팁';
  @override String get welcome => '환영,';
  @override String get signcontinue => '계속하려면 로그인하십시오';
}