if [ "$SSL" == "FALSE" ]; then
    s3cmd --host=$S3_HOST --access_key=$ACCESS_KEY --secret_key=$SECRET_KEY --no-ssl ls >/var/www/html/results.html
else
   s3cmd --host=$S3_HOST --access_key=$ACCESS_KEY --secret_key=$SECRET_KEY ls >/var/www/html/results.html
fi

psql -h $PSQL_HOST -U $PSQL_USER -l>>/var/www/html/results.html
