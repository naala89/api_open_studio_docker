server {
    listen      80;
    server_name ADMIN_DOMAIN;
    index       index.php;
    error_log   /var/log/nginx/error.log debug;
    access_log  /var/log/nginx/access.log;
    root        /var/www/html/admin/public;

    location / {
        try_files $uri /index.php$is_args$args;
    }

    location ~ \.php$ {
        try_files               $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include                 fastcgi_params;
        fastcgi_param           SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param           SCRIPT_NAME $fastcgi_script_name;
        fastcgi_index           index.php;
        fastcgi_pass            php:9000;
    }

    location ~* \.(js|jpg|png|svg|css)$ {
        expires 1d;
    }

    location ~ /\.ht {
        deny all;
    }
}
