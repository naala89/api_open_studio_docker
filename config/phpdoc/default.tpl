server {
    listen 80;
    server_name PHPDOC_DOMAIN;
    index index.html;
    error_log /var/log/nginx/error.log debug;
    access_log /var/log/nginx/access.log;
    root /var/www/html;

    location ~* \.(js|jpg|png|svg|css)$ {
        expires 1d;
    }

    location ~ /\.ht {
        deny all;
    }
}
