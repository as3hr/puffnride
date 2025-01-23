import 'BaseLanguage.dart';

class LanguageEs extends BaseLanguage {
  @override String get appName => 'Conductor poderoso';
  @override String get thisFieldRequired => 'Este campo es obligatorio';
  @override String get email => 'Correo electrónico';
  @override String get password => 'Contraseña';
  @override String get forgotPassword => '¿Has olvidado tu contraseña?';
  @override String get logIn => 'Acceso';
  @override String get orLogInWith => 'O iniciar sesión con';
  @override String get donHaveAnAccount => '¿No tienes una cuenta?';
  @override String get signUp => 'Inscribirse';
  @override String get firstName => 'Nombre de pila';
  @override String get lastName => 'Apellido';
  @override String get userName => 'Nombre de usuario';
  @override String get phoneNumber => 'Número de teléfono';
  @override String get changePassword => 'Cambiar la contraseña';
  @override String get oldPassword => 'Contraseña anterior';
  @override String get newPassword => 'Nueva contraseña';
  @override String get confirmPassword => 'confirmar Contraseña';
  @override String get passwordDoesNotMatch => 'Las contraseñas no coinciden';
  @override String get passwordInvalid => 'La longitud mínima de la contraseña debe ser 8';
  @override String get yes => 'Sí';
  @override String get no => 'No';
  @override String get writeMessage => 'Escribe un mensaje....';
  @override String get enterTheEmailAssociatedWithYourAccount => 'Ingrese el correo electrónico asociado con su cuenta';
  @override String get submit => 'Entregar';
  @override String get language => 'Idioma';
  @override String get notification => 'Notificación';
  @override String get useInCaseOfEmergency => 'Uso en caso de emergencia';
  @override String get notifyAdmin => 'Notificar a administrador';
  @override String get notifiedSuccessfully => 'Notificado con éxito';
  @override String get complain => 'Quejarse';
  @override String get pleaseEnterSubject => 'Por favor ingrese sujeto';
  @override String get writeDescription => 'Escriba una descripción....';
  @override String get saveComplain => 'Guardar quejarse';
  @override String get address => 'DIRECCIÓN';
  @override String get updateProfile => 'Actualización del perfil';
  @override String get notChangeUsername => 'No puedes cambiar el nombre de usuario';
  @override String get notChangeEmail => 'No puede cambiar la identificación de correo electrónico';
  @override String get profileUpdateMsg => 'Perfil actualizado con éxito';
  @override String get emergencyContact => 'Contacto de emergencia';
  @override String get areYouSureYouWantDeleteThisNumber => '¿Estás seguro de que quieres eliminar este número?';
  @override String get addContact => 'Agregar contacto';
  @override String get save => 'Ahorrar';
  @override String get availableBalance => 'Saldo disponible';
  @override String get recentTransactions => 'Transacciones Recientes';
  @override String get moneyDeposited => 'Dinero depositado';
  @override String get addMoney => 'Agregar dinero';
  @override String get cancel => 'Cancelar';
  @override String get pleaseSelectAmount => 'Seleccione la cantidad';
  @override String get amount => 'Cantidad';
  @override String get confirm => 'Confirmar';
  @override String get wallet => 'Billetera';
  @override String get paymentDetail => 'Detalles de pago';
  @override String get rideId => 'ID de viaje';
  @override String get viewHistory => 'Ver historial';
  @override String get paymentDetails => 'Detalles del pago';
  @override String get paymentType => 'Tipo de pago';
  @override String get paymentStatus => 'Estado de pago';
  @override String get priceDetail => 'Detalle del precio';
  @override String get basePrice => 'Precio base';
  @override String get distancePrice => 'Precio de distancia';
  @override String get waitTime => 'Tiempo de espera';
  @override String get extraCharges => 'Cargos extras';
  @override String get couponDiscount => 'Descuento de cupón';
  @override String get total => 'Total';
  @override String get payment => 'Pago';
  @override String get cash => 'Dinero';
  @override String get waitingForDriverConformation => 'Esperando a la conformación';
  @override String get tip => 'Consejo';
  @override String get pay => 'Pagar';
  @override String get howWasYourRide => '¿Cómo estuvo tu viaje?';
  @override String get addReviews => 'Agregar reseñas';
  @override String get writeYourComments => 'Escribe tus reseñas ....';
  @override String get continueD => 'Continuar';
  @override String get detailScreen => 'Detalle de viaje';
  @override String get rideHistory => 'Historial de viaje';
  @override String get emergencyContacts => 'Contactos de emergencia';
  @override String get logOut => 'Cerrar sesión';
  @override String get areYouSureYouWantToLogoutThisApp => '¿Estás seguro de que quieres iniciar sesión en esta aplicación?';
  @override String get destinationLocation => 'Ubicación de destino';
  @override String get profile => 'Perfil';
  @override String get privacyPolicy => 'política de privacidad';
  @override String get helpSupport => 'Servicio de asistencia';
  @override String get termsConditions => 'Términos y condiciones';
  @override String get aboutUs => 'Sobre nosotros';
  @override String get rides => 'Paseos';
  @override String get sendOTP => 'Enviar OTP';
  @override String get carModel => 'Modelo de auto';
  @override String get sos => 'LLAMADA DE SOCORRO';
  @override String get signInUsingYourMobileNumber => 'Inicie sesión usando su número \ nmobile';
  @override String get accepted => 'Aceptado';
  @override String get arriving => 'Que llega';
  @override String get arrived => 'Llegó';
  @override String get cancelled => 'Cancelado';
  @override String get completed => 'Terminado';
  @override String get pleaseEnableLocationPermission => 'Activar permiso de ubicación';
  @override String get pending => 'Pendiente';
  @override String get failed => 'Fallido';
  @override String get paid => 'Pagado';
  @override String get male => 'Masculino';
  @override String get female => 'Femenino';
  @override String get other => 'Otro';
  @override String get addExtraCharges => 'Agregar cargos adicionales';
  @override String get enterAmount => 'Ingresar la cantidad';
  @override String get pleaseAddedAmount => 'Por favor agregó la cantidad';
  @override String get title => 'Título';
  @override String get charges => 'Cargos';
  @override String get saveCharges => 'Guardar cargos';
  @override String get bankName => 'Nombre del banco';
  @override String get bankCode => 'Codigo bancario';
  @override String get accountHolderName => 'nombre del titular de la cuenta';
  @override String get accountNumber => 'Número de cuenta';
  @override String get updateBankDetail => 'Actualizar detalles del banco';
  @override String get addBankDetail => 'Agregar detalles del banco';
  @override String get bankInfoUpdateSuccessfully => 'Actualización de información bancaria correctamente';
  @override String get youAreOnlineNow => 'Estás en línea ahora';
  @override String get youAreOfflineNow => 'Estás fuera de línea ahora';
  @override String get requests => 'Peticiones';
  @override String get areYouSureYouWantToCancelThisRequest => '¿Estás seguro de que quieres cancelar esta solicitud?';
  @override String get decline => 'Rechazar';
  @override String get accept => 'Aceptar';
  @override String get areYouSureYouWantToAcceptThisRequest => '¿Estás seguro de que quieres aceptar esta solicitud?';
  @override String get call => 'Llamar';
  @override String get areYouSureYouWantToArriving => '¿Estás seguro de que quieres llegar?';
  @override String get areYouSureYouWantToArrived => '¿Estás seguro de que quieres llegar?';
  @override String get enterOtp => 'Ingrese OTP';
  @override String get pleaseEnterValidOtp => 'Por favor ingrese OTP válido';
  @override String get pleaseSelectService => 'Seleccione Servicio';
  @override String get userDetail => 'Detalle del usuario';
  @override String get selectService => 'Seleccione Servicio';
  @override String get carColor => 'Color del coche';
  @override String get carPlateNumber => 'Número de placa de coche';
  @override String get carProductionYear => 'Año de producción';
  @override String get withDraw => 'Retirar';
  @override String get withdrawHistory => 'Retirar el historial';
  @override String get approved => 'Aprobado';
  @override String get requested => 'Solicitado';
  @override String get updateVehicle => 'Actualizar vehículo';
  @override String get userNotApproveMsg => 'Su perfil está en revisión. Espere un tiempo o comuníquese con su administrador.';
  @override String get uploadFileConfirmationMsg => '¿Estás seguro de que quieres cargar este archivo?';
  @override String get selectDocument => 'Seleccionar documento';
  @override String get addDocument => 'Agregar documento';
  @override String get areYouSureYouWantToDeleteThisDocument => '¿Estás seguro de que quieres eliminar este documento?';
  @override String get expireDate => 'Fecha de caducidad';
  @override String get goDashBoard => 'Panel de control';
  @override String get deleteAccount => 'Borrar cuenta';
  @override String get account => 'Cuenta';
  @override String get areYouSureYouWantPleaseReadAffect => '¿Estás seguro de que quieres eliminar tu cuenta? Lea cómo afectará la eliminación de la cuenta.';
  @override String get deletingAccountEmail => 'Eliminar su cuenta elimina la información personal de nuestra base de datos. Su correo electrónico se reserva permanentemente y el mismo correo electrónico no puede reutilizarse para registrar una nueva cuenta';
  @override String get areYouSureYouWantDeleteAccount => '¿Estás seguro de que quieres eliminar la cuenta?';
  @override String get yourInternetIsNotWorking => 'Tu Internet no funciona';
  @override String get allow => 'Permitir';
  @override String get mostReliableMightyDriverApp => 'Aplicación de controlador poderosa más confiable';
  @override String get toEnjoyYourRideExperiencePleaseAllowPermissions => 'Para disfrutar de su experiencia de viaje \ nlease nos permita los siguientes permisos';
  @override String get cashCollected => 'Efectivo recolectado';
  @override String get areYouSureCollectThisPayment => '¿Está seguro de que recauda este pago?';
  @override String get txtURLEmpty => 'URL está vacía';
  @override String get lblFollowUs => 'Síganos';
  @override String get bankInfo => 'Información bancaria';
  @override String get duration => 'Duración';
  @override String get moneyDebit => 'Débito de dinero';
  @override String get vehicleInfo => 'Información del vehículo';
  @override String get demoMsg => 'El rol de probador no se permite realizar esta acción';
  @override String get youCannotChangePhoneNumber => 'No puedes cambiar el número de teléfono';
  @override String get offLine => 'Desconectado';
  @override String get online => 'En línea';
  @override String get aboutRider => 'Sobre piloto';
  @override String get pleaseEnterMessage => 'Por favor ingrese el mensaje';
  @override String get pleaseSelectRating => 'Seleccione la calificación';
  @override String get serviceInfo => 'Información de servicio';
  @override String get youCannotChangeService => 'No puedes cambiar el servicio';
  @override String get vehicleInfoUpdateSucessfully => 'Actualización de información del vehículo con éxito';
  @override String get isMandatoryDocument => '* es un documento obligatorio.';
  @override String get someRequiredDocumentAreNotUploaded => 'No se cargan algún documento requerido. Cargue todos los documentos requeridos.';
  @override String get areYouCertainOffline => '¿Estás seguro de que quieres desconectar?';
  @override String get areYouCertainOnline => '¿Estás seguro de que quieres conectarte?';
  @override String get pleaseAcceptTermsOfServicePrivacyPolicy => 'Acepte los términos de la política de servicio y privacidad';
  @override String get rememberMe => 'Acuérdate de mí';
  @override String get agreeToThe => 'Estoy de acuerdo con la';
  @override String get invoice => 'Factura';
  @override String get riderInformation => 'Información del jinete';
  @override String get customerName => 'Nombre del cliente';
  @override String get sourceLocation => 'Ubicación de origen';
  @override String get invoiceNo => 'Factura no';
  @override String get invoiceDate => 'Fecha de la factura';
  @override String get orderedDate => 'Fecha ordenada';
  @override String get totalEarning => 'Ganancias totales';
  @override String get pleaseSelectFromDateAndToDate => 'Seleccione la fecha y hasta la fecha';
  @override String get fromDate => 'Partir de la fecha';
  @override String get toDate => 'Hasta la fecha';
  @override String get ride => 'Conducir';
  @override String get weeklyOrderCount => 'Recuento de pedidos semanales';
  @override String get distance => 'Distancia';
  @override String get iAgreeToThe => 'Estoy de acuerdo con la';
  @override String get today => 'Hoy';
  @override String get weekly => 'Semanalmente';
  @override String get report => 'Informe';
  @override String get earning => 'Ganador';
  @override String get todayEarning => 'Hoy ganando';
  @override String get available => 'Disponible';
  @override String get notAvailable => 'No disponible';
  @override String get youWillReceiveNewRidersAndNotifications => 'Recibirá nuevos ciclistas y notificaciones';
  @override String get youWillNotReceiveNewRidersAndNotifications => 'No recibirá nuevos ciclistas y notificaciones';
  @override String get yourAccountIs => 'Tu cuenta es';
  @override String get pleaseContactSystemAdministrator => 'Póngase en contacto con el administrador del sistema';
  @override String get youCanNotThisActionsPerformBecauseYourCurrentRideIsNotCompleted => 'No puede realizar estas acciones, porque su viaje actual no se completa';
  @override String get applyExtraCharges => 'Aplicar cargos adicionales';
  @override String get pleaseSelectExtraCharges => 'Seleccione cargos adicionales';
  @override String get unsupportedPlatForm => 'Plataforma no compatible';
  @override String get description => 'Descripción';
  @override String get price => 'Precio';
  @override String get gallery => 'Galería';
  @override String get camera => 'Cámara';
  @override String get locationNotAvailable => 'Ubicación no disponible';
  @override String get bankInfoNotFound => 'Información bancaria no encontrada';
  @override String get minimum => 'Mínimo';
  @override String get maximum => 'Máximo';
  @override String get required => 'requerido';
  @override String get paymentFailed => 'Pago fallido';
  @override String get checkConsoleForError => 'Verifique la consola en busca de error';
  @override String get transactionFailed => 'Transacción fallida';
  @override String get transactionSuccessful => 'Transacción exitosa';
  @override String get payWithCard => 'Pagar con tarjeta';
  @override String get success => 'Éxito';
  @override String get declined => 'Rechazado';
  @override String get endRide => 'Viaje final';
  @override String get startRide => 'Comenzar';
  @override String get invoiceCapital => 'FACTURA';
  @override String get validateOtp => 'Validar OTP';
  @override String get otpCodeHasBeenSentTo => 'El código OTP ha sido enviado a';
  @override String get pleaseEnterOtp => 'Ingrese OTP a continuación para verificar su número de teléfono móvil.';
  @override String get selectSources => 'Seleccionar fuentes';
  @override String get file => 'Archivo';
  @override String get earnings => 'Ganancias';
  @override String get documents => 'Documentos';
  @override String get settings => 'Ajustes';
  @override String get finishMsg => '¿Estás seguro de que el viaje ha terminado?';
  @override String get extraFees => 'Aplicar tarifas adicionales';
  @override String get skip => 'Saltar';
  @override String get noteSelectFromDate => 'Nota: Seleccione desde la fecha';
  @override String get chatWithAdmin => 'Chatear con Admin';
  @override String get startRideAskOTP => 'Para comenzar el viaje, solicite al cliente su OTP.';
  @override String get lessWalletAmountMsg => 'No puede montar porque su equilibrio de billetera está por debajo del límite. Agregue dinero a su billetera ahora para continuar usando la aplicación de conductor';
  @override String get via => 'A través de';
  @override String get status => 'Estado';
  @override String get minutePrice => 'Precio minucioso';
  @override String get waitingTimePrice => 'Precio de tiempo de espera';
  @override String get additionalFees => 'Cuotas adicionales';
  @override String get minimumFees => 'Tarifas mínimas';
  @override String get tips => 'Consejos';
  @override String get welcome => 'Bienvenido,';
  @override String get signcontinue => 'Iniciar sesión para continuar';
}
