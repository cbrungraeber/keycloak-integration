#!/bin/sh
openssl genrsa -out ./private.key 2048
openssl req -new -x509 -key ./private.key -out ./public.cer -days 365 -subj "/C=DE/ST=Stuttgart/L=Baden-Wurttemberg/O=ENGINEERING Software Labs/CN=localhost"
