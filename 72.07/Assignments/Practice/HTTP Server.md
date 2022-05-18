# try_ HTTP Server

### Comandos importantes

Para ver todos los logo en tiempo real:

```
tail -f /var/log/nginx/*
```

### Archivos Importantes

- `/etc/nginx/sites-available/*`: Paginas de configuration guardas pero no activadas.
- `/etc/nginx/sites-enabled/*` Paginas de configuración activas.

Pagina de configuración:

```nginx
# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#
server {
	# Listens on IPv4 on port 80
	listen 80;
	
# Listens on IPv6 on port 80	
	listen [::]:80;
#
# Host name
	server_name example.com;
#
# Folder where the website is stored
  root /var/www/example.com;
#
# Set place for access log
        access_log /var/log/nginx/foo_access.log;
# Set place for error log
        error_log /var/log/nginx/foo_error.log;
# HTML Page that will be opened on the host
	index index.html;
#
# ???
	location / {
		try_files $uri $uri/ =404;
	}
}
```

## Como levantar un servidor

1. Instalar Nginx

   ```bash
   sudo apt-get install nginx
   ```

2. Agregar archivo de configuración:

   ```
   sudo nano /etc/nginx/sites-enabled/foo
   ```

   Con los contenidos de los archivos importantes

3. Crear `index.html` en la ubicación indicada.

4. Crear archivos donde se van a registrar los logs:

   ```bash
   sudo touch /var/log/nginx/foo_access.log /var/log/nginx/foo_error.log
   ```
   
5. (Opcional) Agregar el host al archivo de hosts:
   ```bash
   sudo nano /etc/hosts
   ```

   Y agrego la siguiente linea:

   ```
   127.0.0.1 foo
   ```

## Reverse proxy

Para hacer un reverse proxy el proceso es similar a este, pero en el archivo de configuración no hay que asignar un índex ni un root. Lo que hay que hacer es usar `location` para asignarle a donde tiene que redirigir el trafico.

Para esto agregamos el siguiente código a nuestra configuración de nginx:

```nginx
location / {
                proxy_pass      http://127.0.0.1:2020;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
}
```

Siendo `proxy_pass` la dirección y puerto al cual el trafico va a ser redireccionado. El resto de los parámetros indican que se deben agregar esos headers a la llamada.

## Para que Comprima Nginx

```nginx
server {
  gzip on; 
  gzip_disable "msie6";
  gzip_vary on;
  gzip_proxied any;
  gzip_comp_level 6;
  gzip_buffers 16 8k;
  gzip_http_version 1.1;
  gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
  
}
```



