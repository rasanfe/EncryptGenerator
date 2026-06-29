# 🔐 EncryptGenerator

![PowerBuilder](https://img.shields.io/badge/PowerBuilder-2025-orange?style=flat-square&logo=sap&logoColor=white)
![Cifrado](https://img.shields.io/badge/cifrado-AES%20CBC-2EA043?style=flat-square&logo=letsencrypt&logoColor=white)
![Blog](https://img.shields.io/badge/blog-rsrsystem-FF5722?style=flat-square&logo=blogger&logoColor=white)

> Una pequeña herramienta para **sacar las claves de cifrado fuera del código fuente** y dormir un poco más tranquilos. 😴

---

## 📋 ¿Qué es esto?

Seguro que más de una vez os habéis encontrado con claves de conexión, contraseñas de
correo o de FTP **incrustadas a pelo en el código**. Funciona, sí… pero si alguien
descompila la aplicación, se lo lleva todo de regalo.

**EncryptGenerator** es un ejemplo didáctico que propone una forma sencilla de evitarlo:
en el código fuente solo guardáis una **Clave Maestra** y un **Vector de Iniciación
Maestro** que *no sirven para nada por sí solos*. Su única misión es **descifrar un token**
que guardáis en el `.ini` de la aplicación, y dentro de ese token (un JSON cifrado) viven
las **claves reales** de cifrado:

```json
{ "key": "claveReal", "IV": "vectorReal" }
```

Así, aunque alguien le eche el ojo al `.ini` solo encuentra el token cifrado; y aunque
descompile el `.exe` solo encuentra la clave maestra, que sin el token tampoco le vale.
Hay que tener **las dos piezas** para reconstruir el secreto.

## ✨ Cómo funciona

Todo se apoya en los objetos **nativos** de PowerBuilder, sin frameworks ni librerías
externas. Una auténtica gozada de simplicidad:

- **`n_cst_security`** — el corazón del ejemplo. Cifra y descifra con **AES** en modo
  **CBC** y **PKCS padding** (`crypterobject`), y codifica el resultado en **Base64URL**
  (`coderobject`). Su función `of_get_token()` abre el token con la clave maestra y os
  devuelve la `key` y el `IV` reales.
- **`n_cst_key_generator`** — un generador de contraseñas robustas (longitud
  configurable, con mayúsculas, minúsculas, números y símbolos garantizados, y un buen
  mezclado final). Ideal para crear las claves maestras sin estrujarse la cabeza.

Fijaos en un detalle práctico: las claves y los vectores se ajustan siempre a **16
caracteres** (se rellenan con `*` o `0` si hacen falta), porque AES es muy tiquismiquis
con los tamaños.

## 🛠️ Requisitos

- **PowerBuilder 2025** (usa los objetos nativos `crypterobject` y `coderobject`).
- Nada más. Sin instalaciones ni dependencias externas. 🎉

## ▶️ Cómo probarlo

1. Clona el repo y abre `EncryptGenerator.pbsln` en el IDE (está **en modo solución**:
   clonas y compila).
2. Ejecuta la aplicación. En la ventana principal:
   - Genera (o escribe) la **Clave Maestra** y el **Vector Maestro** → estos van a tu
     **código fuente**.
   - Genera (o escribe) la **Clave** y el **Vector** reales → los que cifrarán tus datos.
   - Pulsa para **generar el Token** y cópialo al `.ini` de tu aplicación.
3. Usa las cajas de **Encrypt / Decrypt** para comprobar que ciframos y desciframos
   correctamente con esas claves.

> 💡 Este generador es justo el que alimenta al ejemplo **BackupFtpApp**: allí el token
> generado aquí sirve para guardar cifradas las contraseñas de SQL Server, correo y FTP.

## 🔗 Repo PowerBuilder

Tenéis el ejemplo publicado **en modo solución** aquí:
<https://github.com/rasanfe/EncryptGenerator>

---

> ¡Nos vemos en el próximo artículo! Y recuerda: en PowerBuilder, los límites solo están en nuestra imaginación. 🚀

📨 **Blog:** <https://rsrsystem.blogspot.com/>
