forward
global type n_cst_security from nonvisualobject
end type
end forward

global type n_cst_security from nonvisualobject
end type
global n_cst_security n_cst_security

forward prototypes
public function boolean of_get_token (string as_token, string as_masterkey, string as_masteriv, ref string as_key, ref string as_iv)
public function string of_decrypt (string as_source, string as_key, string as_iv)
public function string of_encrypt (string as_source, string as_key, string as_iv)
end prototypes

public function boolean of_get_token (string as_token, string as_masterkey, string as_masteriv, ref string as_key, ref string as_iv);//Funcion para recuperar Clave y Vector de iniciación. La información está almacenada encriptada en un json. {"key":"clave", "IV":"vector"}
coderobject ln_coderobject
crypterobject ln_crypterobject
String ls_json
Blob  lb_json_decoded, lb_json_decrypted, lblb_key, lblb_iv
Encoding lEncoding = EncodingUTF8!
JsonParser lnv_JsonParser
Long ll_RootObject, ll_item

IF as_token = "" THEN
	Messagebox("Error", "Hay que generar el Token Primero!")
	RETURN FALSE
END IF	

//Corregimos los Tamaños de la Clave y de Vector
as_Masterkey = as_Masterkey + fill("*", 16 - len(as_Masterkey))
as_MasterIV = as_MasterIV + fill("0", 16 - len(as_MasterIV))

IF as_MasterKey = "" or as_MasterIV = "" THEN
	messagebox("Atención", "Hay que Indicar la Clave y El Vector de la App!")
	RETURN FALSE
END IF

//1- Decode as_source
ln_coderobject = Create coderobject
lb_json_decoded = ln_coderobject.Base64URLDecode(as_token)
destroy ln_coderobject

//2- Decryp ls_decode 
ln_crypterobject = Create crypterobject

lblb_key  = Blob(as_Masterkey, lEncoding)
lblb_iv    = Blob(as_MasterIV, lEncoding)
	
lb_json_decrypted= ln_crypterobject.SymmetricDecrypt(AES!, lb_json_decoded, lblb_key, OperationModeCBC!, lblb_iv, PKCSPadding!)
	
ls_json = String(lb_json_decrypted, lEncoding)

destroy ln_crypterobject

//3-Parseamos el Json Recibido en el Token.
lnv_JsonParser = Create JsonParser

lnv_JsonParser.LoadString(ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

//Retorno por Referencia Key y IV 
as_key = lnv_JsonParser.GetItemString(ll_RootObject, "key")
as_IV =lnv_JsonParser.GetItemString(ll_RootObject, "IV")


destroy lnv_JsonParser
RETURN TRUE
end function

public function string of_decrypt (string as_source, string as_key, string as_iv);coderobject ln_coderobject
crypterobject ln_crypterobject
String ls_decode
String ls_decrypted
String ls_key, ls_IV
Encoding lEncoding = EncodingUTF8!
Blob lblb_data, lblb_key, lblb_iv, lblb_Decrypted

If trim(as_source)="" then return ""

//Corregimos tamaños Key y IV.
as_key = as_key + fill("*", 16 - len(as_key))
as_IV = as_IV + fill("0", 16 - len(as_IV))

//1- Decode as_source
ln_coderobject = Create coderobject
lblb_data = ln_coderobject.Base64URLDecode(as_source)
destroy ln_coderobject

//2- Decryp ls_decode 
lblb_key  = Blob(as_key, lEncoding)
lblb_iv    = Blob(as_IV, lEncoding)

ln_crypterobject = Create crypterobject
lblb_Decrypted = ln_crypterobject.SymmetricDecrypt(AES!, lblb_data, lblb_key, OperationModeCBC!, lblb_iv, PKCSPadding!)
destroy ln_crypterobject

ls_decrypted = String(lblb_Decrypted, lEncoding)

RETURN ls_decrypted
end function

public function string of_encrypt (string as_source, string as_key, string as_iv);coderobject ln_coderobject
crypterobject ln_crypterobject
String ls_encoded
String ls_encrypted
String ls_key, ls_IV
Blob lblb_data, lblb_key, lblb_iv, lblb_Encrypted
Encoding lEncoding = EncodingUTF8!

If trim(as_source)="" then return ""

//Corregimos tamaños Key y IV.
as_key = as_key + fill("*", 16 - len(as_key))
as_IV = as_IV + fill("0", 16 - len(as_IV))

//1- Encryp as_source 
lblb_data = Blob(as_source, lEncoding)
lblb_key  = Blob(as_key, lEncoding)
lblb_iv    = Blob(as_IV, lEncoding)

ln_crypterobject = Create crypterobject	
lblb_Encrypted = ln_crypterobject.SymmetricEncrypt(AES!, lblb_data, lblb_key, OperationModeCBC!, lblb_iv, PKCSPadding! )
destroy ln_crypterobject
	
//2- Encode ls_encrypted
ln_coderobject = Create coderobject
ls_encoded = ln_coderobject.Base64URLEncode(lblb_Encrypted)
destroy ln_coderobject


RETURN ls_encoded
end function

on n_cst_security.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_security.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

