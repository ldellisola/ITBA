# MIME

## 67

> ¿Por qué necesitamos de métodos de codificación como Quoted Printable o Base64 en el envío de correos?

Por que el protocolo de envío de mails solo permite enviar 7-bit ASCII.

## 68

> Decodifique el mensaje codificado en el siguiente correo:
>
> ```
> MIME-Version: 1.0
> Content-Type: multipart/alternative;
> boundary="Boundary-01=_bHUWOieIFHJ6aoh"
> Content-Transfer-Encoding: 7bit
> --Boundary-01=_bHUWOieIFHJ6aoh
> Content-Type: text/plain;
> charset="iso-8859-1"
> Content-Transfer-Encoding: quoted-printable
> h=F3l=E1 c=F3m=F3
> t=E9 v=E1
> =2D-=20
> Buenos Aires, Argentina
> --Boundary-01=_bHUWOieIFHJ6aoh
> ```

Dice:

```
hólá cómó
té vá
-- 
```

## 69

> Utilizando un MUA, cree un correo electrónico cuyo mensaje principal esté formateado en HTML (agregue links; e imágenes externas). Adjunte también un archivo TXT, una imagen JPG, y una imagen PNG. Guárdelo como Draft, y vea su “código fuente”.
>
> 1. Revise su estructura MIME

```
MIME-Version: 1.0
Date: Tue, 26 Apr 2022 13:46:58 -0300
Message-ID: <CAAoPM_CEinSVzU6f7JRrORW9z4uRmFP_GbaEPDeLFe9S5sP0Vg@mail.gmail.com>
Subject: protos
From: "Lucas Dell'Isola" <ldellisola@itba.edu.ar>
To: "Lucas Dell'Isola" <ldellisola@itba.edu.ar>
Content-Type: multipart/mixed; boundary="00000000000001f09b05dd9171b1"

--00000000000001f09b05dd9171b1
Content-Type: multipart/alternative; boundary="00000000000001f09705dd9171af"

--00000000000001f09705dd9171af
Content-Type: text/plain; charset="UTF-8"

itba <www.itba.edu.ar>

--00000000000001f09705dd9171af
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br>
<a href="www.itba.edu.ar"> itba</a>
<img src="https://www.itba.edu.ar/wp-content/uploads/2021/08/ITBA-logo.png">
</div>

--00000000000001f09705dd9171af--
--00000000000001f09b05dd9171b1
Content-Type: image/jpeg; name="Screen Shot 2022-04-22 at 16.35.11.jpg"
Content-Disposition: attachment; filename="Screen Shot 2022-04-22 at 16.35.11.jpg"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_l2gdmngb0
Content-ID: <f_l2gdmngb0>


--00000000000001f09b05dd9171b1
Content-Type: application/octet-stream; name="nano.save"
Content-Disposition: attachment; filename="nano.save"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_l2gdn08p1
Content-ID: <f_l2gdn08p1>


--00000000000001f09b05dd9171b1--
```

> 2. ¿Qué es cada parte MIME? Si el mensaje presenta una versión txt/plain del texto que usted escribió analice porque lo incluye si usted escribió un HTML.



> 3. Fowardee el correo draft como un adjunto MIME. ¿Cuales partes MIME que contienen
>    otras partes?



> 4. ¿Para que sirve el header Content-ID?



> 5. ¿Para que sirve el header Content-Disposition?



> 6. Investigue el formato de los siguientes Media-Type:
>    1. `multipart/digest`
>    2. `multipart/mixed`
>    3. `message/rfc822`
>    4. `multipart/alternative`
>    5. `multipart/related`
>    6. `multipart/report`