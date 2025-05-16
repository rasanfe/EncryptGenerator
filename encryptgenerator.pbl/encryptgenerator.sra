//objectcomments Generated Application Object
forward
global type encryptgenerator from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type encryptgenerator from application
string appname = "encryptgenerator"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "icono.ico"
string appruntimeversion = "25.0.0.3683"
boolean manualsession = false
boolean unsupportedapierror = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
integer highdpimode = 0
end type
global encryptgenerator encryptgenerator

on encryptgenerator.create
appname="encryptgenerator"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on encryptgenerator.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_main)
end event

