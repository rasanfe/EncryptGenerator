forward
global type n_cst_key_generator from nonvisualobject
end type
end forward

global type n_cst_key_generator from nonvisualobject
end type
global n_cst_key_generator n_cst_key_generator

type variables
Constant String is_Minusculas = "abcdefghijklmnopqrstuvwxyz"  
Constant String is_Mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
Constant String is_Numeros= "1234567890"
Constant String is_Simbolos= "!@#$%^&*()-_+={}[]|;:.<>?`~,"
Private Integer ii_totalCaracteres = 12
end variables

forward prototypes
public function boolean of_validar (string as_clave)
public function string of_generar ()
public subroutine of_total_caracteres (integer ai_totalcaracteres)
public function string of_mezclar (string as_clave)
end prototypes

public function boolean of_validar (string as_clave);Boolean lb_tieneMayuscula = False
Boolean lb_tieneMinuscula = False
Boolean lb_tieneNumero = False
Boolean lb_tieneSimbolo = False
Boolean lb_longitud = True
Integer li_idx
String ls_caracter

// VerIficar si la contraseña tiene el minimo de caracteres
If len(as_clave) < ii_TotalCaracteres Then
	lb_longitud = False
else		
	For li_idx = 1 To Len(as_Clave)
		  ls_caracter = Mid(as_Clave, li_idx, 1)
			  
		  If Pos(is_Mayusculas, ls_caracter) > 0 Then
			lb_tieneMayuscula = True
			Continue
		  End If
			  
		  If Pos(is_Minusculas, ls_caracter) > 0 Then
			lb_tieneMinuscula = True
			Continue
		  End If
			  
		  If Pos(is_Numeros, ls_caracter) > 0 Then
			lb_tieneNumero = True
			Continue
		  End If
			  
		  If Pos(is_Simbolos, ls_caracter) > 0 Then
			lb_tieneSimbolo = True
			Continue
		  End If
	Next
End IF

// La contraseña es válida si contiene al menos una mayúscula, una minúscula, un número y un símbolo
If lb_longitud And lb_tieneMayuscula And lb_tieneMinuscula And lb_tieneNumero And lb_tieneSimbolo Then
	Return True
Else
	Return False
End If

end function

public function string of_generar ();Integer li_idx, li_random
Integer li_TotalLetras, li_TotalMayusculas, li_TotalMinusculas, li_TotalNumeros, li_TotalSimbolos
String ls_ClaveGenerada
String ls_Todo

Randomize(0)

// Inicializar la clave generada
ls_ClaveGenerada = ""

// Inicializar las cantidades mínimas de cada tipo de carácter
li_TotalMayusculas = 1
li_TotalMinusculas = 1
li_TotalNumeros = 1
li_TotalSimbolos = 1

// Generar una letra mayúscula aleatoria
For li_idx = 1 To li_TotalMayusculas
	li_random = Rand(Len(is_Mayusculas)) + 1
	ls_ClaveGenerada += Mid(is_Mayusculas, li_random, 1)
Next

// Generar una letra minúscula aleatoria
For li_idx = 1 To li_TotalMinusculas
	li_random = Rand(Len(is_Minusculas)) + 1
	ls_ClaveGenerada += Mid(is_Minusculas, li_random, 1)
Next

// Generar un número aleatorio
For li_idx = 1 To li_TotalNumeros
	li_random = Rand(Len(is_Numeros)) + 1
	ls_ClaveGenerada += Mid(is_Numeros, li_random, 1)
Next

// Generar un símbolo aleatorio
For li_idx = 1 To li_TotalSimbolos
	li_random = Rand(Len(is_Simbolos)) + 1
    ls_ClaveGenerada += Mid(is_Simbolos, li_random, 1)
Next

// Rellenar el resto con caracteres aleatorios de todos los tipos
li_TotalLetras = ii_totalCaracteres - Len(ls_ClaveGenerada)
ls_Todo = is_Mayusculas+is_Minusculas + is_Numeros + is_Simbolos

For li_idx = 1 To li_TotalLetras
	li_random = Rand(Len(ls_Todo)) + 1
	ls_ClaveGenerada += Mid(ls_Todo, li_random, 1)
Next

// Mezclar la contraseña para asegurarnos de que los caracteres están distribuidos aleatoriamente
ls_ClaveGenerada = of_mezclar(ls_ClaveGenerada)

// Validar la contraseña generada
If of_validar(ls_ClaveGenerada) = False Then
	ls_ClaveGenerada = of_generar()
End If

Return ls_ClaveGenerada


end function

public subroutine of_total_caracteres (integer ai_totalcaracteres);ii_totalCaracteres = ai_totalCaracteres
end subroutine

public function string of_mezclar (string as_clave);Integer li_idx, li_pos1, li_pos2
String ls_tmp, ls_mezclada

ls_mezclada = as_Clave

For li_idx = 1 To Len(as_Clave) * 2
	li_pos1 = Rand(Len(as_Clave)) + 1
	li_pos2 = Rand(Len(as_Clave)) + 1
	ls_tmp = Mid(ls_mezclada, li_pos1, 1)
	ls_mezclada = Replace(ls_mezclada, li_pos1, 1, Mid(ls_mezclada, li_pos2, 1))
	ls_mezclada = Replace(ls_mezclada, li_pos2, 1, ls_tmp)
Next

Return ls_mezclada
end function

on n_cst_key_generator.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_key_generator.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

