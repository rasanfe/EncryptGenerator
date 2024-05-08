$PBExportHeader$n_cst_key_generator.sru
forward
global type n_cst_key_generator from nonvisualobject
end type
end forward

global type n_cst_key_generator from nonvisualobject
end type
global n_cst_key_generator n_cst_key_generator

type variables
Constant String is_caracteresPermitidos = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
Constant String is_numerosPermitidos= "1234567890"
Constant String is_simbolosPermitidos= "!@#$%^&*()-_+={}[]|;:.<>?`~,"
Private Integer ii_totalCaracteres = 12
end variables

forward prototypes
public function boolean of_validar (string as_clave)
public function string of_generar ()
public subroutine of_total_caracteres (integer ai_totalcaracteres)
end prototypes

public function boolean of_validar (string as_clave);Boolean lb_longitud = True
Boolean lb_tieneCaracter = False
Boolean lb_tieneNumero = False
Boolean lb_tieneSimbolo = False
Integer li_i

// VerIficar si la contraseña tiene el minimo de caracteres
If len(as_clave) < ii_TotalCaracteres Then
	lb_longitud = False
End If	

// Verificar si la contraseña contiene al menos un carácter permitido
For li_i = 1 To Len(is_caracteresPermitidos)
    If Pos(as_clave, Mid(is_caracteresPermitidos, li_i, 1)) > 0 Then
        lb_tieneCaracter = True
        Exit
    End If
Next

// Verificar si la contraseña contiene al menos un número permitido
For li_i = 1 To Len(is_numerosPermitidos)
    If Pos(as_clave, Mid(is_numerosPermitidos, li_i, 1)) > 0 Then
        lb_tieneNumero = True
        Exit
    End If
Next

// Verificar si la contraseña contiene al menos un símbolo permitido
For li_i = 1 To Len(is_simbolosPermitidos)
    If Pos(as_clave, Mid(is_simbolosPermitidos, li_i, 1)) > 0 Then
        lb_tieneSimbolo = True
        Exit
    End If
Next

// Verificar si la contraseña cumple con Todos los criterios
If lb_longitud And lb_tieneCaracter And lb_tieneNumero And lb_tieneSimbolo Then
    Return True
ELSE
   Return False
End If

end function

public function string of_generar ();// Función para generar una clave de usuario aleatoria
Integer li_idx, li_letras, li_numeros, li_simbolos, li_Totalletras, li_Totalnumeros, li_Totalsimbolos
String ls_ClaveGenerada

Randomize (0)

// Inicializar la clave generada
ls_ClaveGenerada = ""

// Primero Genero hasta 6 letras AleaTorias
li_TotalLetras = Rand(ii_TotalCaracteres - 6)

For li_idx = 1 To li_TotalLetras
    li_letras = Rand(Len(is_caracteresPermitidos))
    ls_ClaveGenerada += Mid(is_caracteresPermitidos, li_letras, 1)
Next

//Generamos hasta 4 Numeros AleaTorios
li_TotalNumeros = Rand(4)

For li_idx = 1 To li_TotalNumeros
     li_numeros = Rand(Len(is_numerosPermitidos))
     ls_ClaveGenerada += Mid(is_numerosPermitidos, li_numeros, 1)
Next

//Generamos hasta 2 Simbolos AleaTorios
li_TotalSimbolos = Rand(2)

For li_idx = 1 To li_TotalSimbolos
    li_simbolos = Rand(Len(is_simbolosPermitidos))
    ls_ClaveGenerada += Mid(is_simbolosPermitidos, li_simbolos, 1)
Next

//Rellenamos lo que falte con letras aleatrias
li_TotalLetras = ii_TotalCaracteres - li_TotalLetras - li_TotalNumeros - li_TotalSimbolos

For li_idx = 1 To li_TotalLetras
    li_letras = Rand(Len(is_caracteresPermitidos))
    ls_ClaveGenerada += Mid(is_caracteresPermitidos, li_letras, 1)
Next

//Valido la Clave.
If of_validar(ls_ClaveGenerada)  = False Then
	ls_ClaveGenerada = of_generar()
End If

Return ls_ClaveGenerada


end function

public subroutine of_total_caracteres (integer ai_totalcaracteres);ii_totalCaracteres = ai_totalCaracteres
end subroutine

on n_cst_key_generator.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_key_generator.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

