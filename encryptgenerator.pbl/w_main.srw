forward
global type w_main from window
end type
type cb_7 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type cb_decrypt from commandbutton within w_main
end type
type cb_encrypt from commandbutton within w_main
end type
type st_2 from statictext within w_main
end type
type sle_encrypt from singlelineedit within w_main
end type
type st_1 from statictext within w_main
end type
type sle_decrypt from singlelineedit within w_main
end type
type sle_master_key from singlelineedit within w_main
end type
type st_master_key from statictext within w_main
end type
type st_master_iv from statictext within w_main
end type
type sle_master_iv from singlelineedit within w_main
end type
type sle_json_iv from singlelineedit within w_main
end type
type st_josn_iv from statictext within w_main
end type
type st_json_key from statictext within w_main
end type
type sle_json_key from singlelineedit within w_main
end type
type sle_json from singlelineedit within w_main
end type
type st_json from statictext within w_main
end type
type sle_token from singlelineedit within w_main
end type
type st_token from statictext within w_main
end type
type cb_ecrypt_josn from commandbutton within w_main
end type
type cb_decrypt_token from commandbutton within w_main
end type
type cb_vopiar from commandbutton within w_main
end type
type p_2 from picture within w_main
end type
type st_info from statictext within w_main
end type
type st_myversion from statictext within w_main
end type
type st_platform from statictext within w_main
end type
type gb_json from groupbox within w_main
end type
type gb_master from groupbox within w_main
end type
type r_2 from rectangle within w_main
end type
end forward

global type w_main from window
integer width = 3223
integer height = 1728
boolean titlebar = true
string title = "EncryptGenerator"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
string icon = "AppIcon!"
boolean center = true
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_decrypt cb_decrypt
cb_encrypt cb_encrypt
st_2 st_2
sle_encrypt sle_encrypt
st_1 st_1
sle_decrypt sle_decrypt
sle_master_key sle_master_key
st_master_key st_master_key
st_master_iv st_master_iv
sle_master_iv sle_master_iv
sle_json_iv sle_json_iv
st_josn_iv st_josn_iv
st_json_key st_json_key
sle_json_key sle_json_key
sle_json sle_json
st_json st_json
sle_token sle_token
st_token st_token
cb_ecrypt_josn cb_ecrypt_josn
cb_decrypt_token cb_decrypt_token
cb_vopiar cb_vopiar
p_2 p_2
st_info st_info
st_myversion st_myversion
st_platform st_platform
gb_json gb_json
gb_master gb_master
r_2 r_2
end type
global w_main w_main

type prototypes

end prototypes

type variables
n_cst_security in_seg 
n_cst_key_generator in_gen
end variables

forward prototypes
public subroutine wf_version (statictext ast_version, statictext ast_patform)
public function boolean wf_get_token (ref string as_key, ref string as_iv)
end prototypes

public subroutine wf_version (statictext ast_version, statictext ast_patform);String ls_version, ls_platform
environment env
integer rtn

rtn = GetEnvironment(env)

IF rtn <> 1 THEN 
	ls_version = string(year(today()))
	ls_platform="32"
ELSE
	ls_version = "20"+ string(env.pbmajorrevision)+ "." + string(env.pbbuildnumber)
	ls_platform=string(env.ProcessBitness)
END IF

ls_platform += " Bits"

ast_version.text=ls_version
ast_patform.text=ls_platform

end subroutine

public function boolean wf_get_token (ref string as_key, ref string as_iv);String ls_token, ls_MasterKey, ls_MasterIV
Boolean lb_result

ls_token = trim(sle_token.text)

IF ls_token = "" THEN
	Messagebox("Error", "Hay que generar el Token Primero!", exclamation!)
	RETURN FALSE
END IF	

ls_MasterKey=trim(sle_master_key.text)
ls_MasterIV=trim(sle_master_iv.text)

lb_result = in_seg.of_get_token(ls_token, ls_MasterKey, ls_MasterIV, ref as_key, ref as_iv)

RETURN lb_result
end function

on w_main.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_decrypt=create cb_decrypt
this.cb_encrypt=create cb_encrypt
this.st_2=create st_2
this.sle_encrypt=create sle_encrypt
this.st_1=create st_1
this.sle_decrypt=create sle_decrypt
this.sle_master_key=create sle_master_key
this.st_master_key=create st_master_key
this.st_master_iv=create st_master_iv
this.sle_master_iv=create sle_master_iv
this.sle_json_iv=create sle_json_iv
this.st_josn_iv=create st_josn_iv
this.st_json_key=create st_json_key
this.sle_json_key=create sle_json_key
this.sle_json=create sle_json
this.st_json=create st_json
this.sle_token=create sle_token
this.st_token=create st_token
this.cb_ecrypt_josn=create cb_ecrypt_josn
this.cb_decrypt_token=create cb_decrypt_token
this.cb_vopiar=create cb_vopiar
this.p_2=create p_2
this.st_info=create st_info
this.st_myversion=create st_myversion
this.st_platform=create st_platform
this.gb_json=create gb_json
this.gb_master=create gb_master
this.r_2=create r_2
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_decrypt,&
this.cb_encrypt,&
this.st_2,&
this.sle_encrypt,&
this.st_1,&
this.sle_decrypt,&
this.sle_master_key,&
this.st_master_key,&
this.st_master_iv,&
this.sle_master_iv,&
this.sle_json_iv,&
this.st_josn_iv,&
this.st_json_key,&
this.sle_json_key,&
this.sle_json,&
this.st_json,&
this.sle_token,&
this.st_token,&
this.cb_ecrypt_josn,&
this.cb_decrypt_token,&
this.cb_vopiar,&
this.p_2,&
this.st_info,&
this.st_myversion,&
this.st_platform,&
this.gb_json,&
this.gb_master,&
this.r_2}
end on

on w_main.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_decrypt)
destroy(this.cb_encrypt)
destroy(this.st_2)
destroy(this.sle_encrypt)
destroy(this.st_1)
destroy(this.sle_decrypt)
destroy(this.sle_master_key)
destroy(this.st_master_key)
destroy(this.st_master_iv)
destroy(this.sle_master_iv)
destroy(this.sle_json_iv)
destroy(this.st_josn_iv)
destroy(this.st_json_key)
destroy(this.sle_json_key)
destroy(this.sle_json)
destroy(this.st_json)
destroy(this.sle_token)
destroy(this.st_token)
destroy(this.cb_ecrypt_josn)
destroy(this.cb_decrypt_token)
destroy(this.cb_vopiar)
destroy(this.p_2)
destroy(this.st_info)
destroy(this.st_myversion)
destroy(this.st_platform)
destroy(this.gb_json)
destroy(this.gb_master)
destroy(this.r_2)
end on

event open;wf_version(st_myversion, st_platform)

in_seg = Create n_cst_security
in_gen = Create n_cst_key_generator



end event

event closequery;destroy in_seg
destroy in_gen
end event

type cb_7 from commandbutton within w_main
integer x = 1175
integer y = 520
integer width = 398
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Generar Vector"
end type

event clicked;sle_master_iv.text = ""

in_gen.of_total_caracteres(16)

sle_master_iv.text = in_gen.of_generar()


end event

type cb_6 from commandbutton within w_main
integer x = 1175
integer y = 408
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Generar Clave"
end type

event clicked;sle_master_key.text = ""

in_gen.of_total_caracteres(16)

sle_master_key.text = in_gen.of_generar()
end event

type cb_5 from commandbutton within w_main
integer x = 2743
integer y = 520
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Generar Vector"
end type

event clicked;sle_json_iv.text = ""

in_gen.of_total_caracteres(16)

sle_json_iv.text = in_gen.of_generar()
end event

type cb_4 from commandbutton within w_main
integer x = 2743
integer y = 408
integer width = 398
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Generar Clave"
end type

event clicked;sle_json_key.text = ""

in_gen.of_total_caracteres(16)

sle_json_key.text = in_gen.of_generar()


end event

type cb_3 from commandbutton within w_main
integer x = 2743
integer y = 1092
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Generar Clave"
end type

event clicked;sle_decrypt.text = ""
sle_decrypt.text = in_gen.of_generar()

end event

type cb_2 from commandbutton within w_main
integer x = 2743
integer y = 688
integer width = 398
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Limpiar"
end type

event clicked;sle_json.text = ""
sle_token.text =""
sle_decrypt.text =""
sle_encrypt.text =""
end event

type cb_1 from commandbutton within w_main
integer x = 2743
integer y = 1204
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "copiar"
end type

event clicked;//Copiamos el Valor Encriptado. Si no se ha encriptado copiamos el Valor sin encriptar. (Para poder copiar claves generadas sin encriptar).
If trim(sle_encrypt.text) = "" Then
	clipboard(trim(sle_decrypt.text))
Else	
	clipboard(trim(sle_encrypt.text))
End IF
end event

type cb_decrypt from commandbutton within w_main
integer x = 1586
integer y = 1328
integer width = 398
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Desencriptar"
end type

event clicked;String ls_source, ls_Decrypted, ls_key, ls_iv

//1 Obtenemos las Claves del Token:
IF wf_get_token(Ref ls_key, ref ls_IV) = FALSE THEN RETURN

ls_source = trim(sle_encrypt.text)

//2 Desencriptamos con Las Claves Obtenidas del Token.
ls_Decrypted = in_seg.of_Decrypt(ls_source, ls_key, ls_iv)

sle_decrypt.text = ls_Decrypted
end event

type cb_encrypt from commandbutton within w_main
integer x = 1175
integer y = 1328
integer width = 398
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Encriptar"
end type

event clicked;String ls_source, ls_encrypted, ls_key, ls_iv


//1 Obtenemos las Claves del Token:
IF wf_get_token(Ref ls_key, ref ls_IV) = FALSE THEN RETURN

ls_source = trim(sle_decrypt.text)

//2 Encriptamos con Las Claves Obtenidas del Token.
ls_encrypted = in_seg.of_Encrypt(ls_source, ls_key, ls_iv)

sle_encrypt.text = ls_encrypted
end event

type st_2 from statictext within w_main
integer x = 55
integer y = 1224
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Encriptado"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_encrypt from singlelineedit within w_main
integer x = 361
integer y = 1212
integer width = 2350
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_main
integer x = 55
integer y = 1108
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Texto"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_decrypt from singlelineedit within w_main
integer x = 361
integer y = 1096
integer width = 2350
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type sle_master_key from singlelineedit within w_main
integer x = 576
integer y = 412
integer width = 585
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "EncriptadorRSR"
borderstyle borderstyle = stylelowered!
end type

type st_master_key from statictext within w_main
integer x = 402
integer y = 416
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Clave"
alignment alignment = Right!
boolean focusrectangle = false
end type

type st_master_iv from statictext within w_main
integer x = 402
integer y = 528
integer width = 142
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "IV"
alignment alignment = Right!
boolean focusrectangle = false
end type

type sle_master_iv from singlelineedit within w_main
integer x = 576
integer y = 524
integer width = 582
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "IV25042023"
borderstyle borderstyle = stylelowered!
end type

type sle_json_iv from singlelineedit within w_main
integer x = 2130
integer y = 524
integer width = 585
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "APP20230425"
borderstyle borderstyle = stylelowered!
end type

type st_josn_iv from statictext within w_main
integer x = 1915
integer y = 528
integer width = 142
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "IV"
alignment alignment = Right!
boolean focusrectangle = false
end type

type st_json_key from statictext within w_main
integer x = 1957
integer y = 416
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Clave"
alignment alignment = Right!
boolean focusrectangle = false
end type

type sle_json_key from singlelineedit within w_main
integer x = 2130
integer y = 412
integer width = 585
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "encrypt@23"
borderstyle borderstyle = stylelowered!
end type

type sle_json from singlelineedit within w_main
integer x = 361
integer y = 696
integer width = 2350
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_json from statictext within w_main
integer x = 55
integer y = 708
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Json"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_token from singlelineedit within w_main
integer x = 361
integer y = 812
integer width = 2350
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_token from statictext within w_main
integer x = 55
integer y = 824
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Token"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ecrypt_josn from commandbutton within w_main
integer x = 1175
integer y = 928
integer width = 398
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Crear Token"
end type

event clicked;String ls_masterKey, ls_masterIV, ls_key, ls_IV, ls_json

ls_key = trim(sle_json_key.text )
ls_iv = trim(sle_json_iv.text) 

IF ls_Key = "" or ls_IV = "" THEN
	messagebox("Atención", "Hay que Indicar la Clave y El Vector para Generar el Json del Token!", exclamation!)
	RETURN 
END IF

ls_json = '{"key":"'+ls_key+'", "IV":"'+ls_IV+'"}'

ls_MasterKey=trim(sle_master_key.text)
ls_MasterIV=trim(sle_master_iv.text)

ls_Masterkey = ls_Masterkey + fill("*", 16 - len(ls_Masterkey))
ls_MasterIV = ls_MasterIV + fill("0", 16 - len(ls_MasterIV))

IF ls_MasterKey = "" or ls_MasterIV = "" THEN
	messagebox("Atención", "Hay que Indicar la Clave y El Vector de la App!", exclamation!)
	RETURN 
END IF

sle_json.text = ls_json
sle_token.Text = in_seg.of_encrypt(ls_json, ls_MasterKey, ls_MasterIV)

end event

type cb_decrypt_token from commandbutton within w_main
integer x = 1586
integer y = 928
integer width = 398
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "Recuperar Json"
end type

event clicked;String ls_key, ls_IV

//1 Obtenemos las Claves del Token:
IF wf_get_token(Ref ls_key, ref ls_IV) = FALSE THEN RETURN

sle_json_key.text = ls_key
sle_json_iv.text = ls_iv
sle_json.text = '{"key":"'+ls_key+'", "IV":"'+ls_IV+'"}'


end event

type cb_vopiar from commandbutton within w_main
integer x = 2743
integer y = 804
integer width = 398
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Hyperlink!"
string text = "copiar"
end type

event clicked;clipboard(trim(sle_token.text))
end event

type p_2 from picture within w_main
integer x = 5
integer y = 4
integer width = 1253
integer height = 248
boolean originalsize = true
string picturename = "logo.jpg"
boolean focusrectangle = false
end type

type st_info from statictext within w_main
integer x = 1874
integer y = 1572
integer width = 1289
integer height = 52
integer textsize = -7
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 553648127
string text = "Copyright © Ramón San Félix Ramón  rsrsystem.soft@gmail.com"
boolean focusrectangle = false
end type

type st_myversion from statictext within w_main
integer x = 2661
integer y = 60
integer width = 489
integer height = 84
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 33521664
string text = "Versión"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_platform from statictext within w_main
integer x = 2661
integer y = 148
integer width = 489
integer height = 84
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 33521664
string text = "Bits"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_json from groupbox within w_main
integer x = 1838
integer y = 340
integer width = 1326
integer height = 316
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 553648127
string text = "Clave y Vector para Json"
end type

type gb_master from groupbox within w_main
integer x = 366
integer y = 340
integer width = 1225
integer height = 316
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 553648127
string text = "Clave y Vector para APP"
end type

type r_2 from rectangle within w_main
long linecolor = 33554432
linestyle linestyle = transparent!
integer linethickness = 4
long fillcolor = 33521664
integer width = 3186
integer height = 260
end type

