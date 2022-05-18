# SSH

SSH es un protocolo, aunque también se puede utilizar como una herramienta para encriptar una aplicación cliente/servidor o una interfaz de comandos. En general, es un remplazo a telnet.

Este protocolo ofrece autenticación, encriptación e integridad

<img src="Resources/12 - SSH/Screen Shot 2022-05-06 at 16.15.26.jpg" alt="Screen Shot 2022-05-06 at 16.15.26" style="zoom:50%;" />

## Port Forwarding

<img src="Resources/12 - SSH/Screen Shot 2022-05-06 at 16.44.57.jpg" alt="Screen Shot 2022-05-06 at 16.44.57" style="zoom:50%;" />

SSH puede encriptar de forma transparente el flujo de datos de otra aplicación, a esto se lo conoce como tunneling. Este proceso redirecciona las conexiones TCP a una conexión SSH, y no se puede realizar con conexiones UDP.

Se puede configurar como un gateway, donde se crea solo un túnel y otros usuarios de la misma red pueden conectarse a el.

## OpenSSH

### Comandos Basicos

- `sshd`: es el daemon que maneja las conexiones entrantes.
- `ssh`: es el comando que permite conectarse de forma remota a un servidor.
- `scp`: version segura de `rcp`, que permite copiar archivos.
- `sftp`: version segura de `ftp`.
- `ssh-keygen`: generador de claves publicas y privadas