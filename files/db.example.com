$ORIGIN example.com.
$TTL 86400

@       IN SOA  dns1.example.com.   hostmaster.example.com. (
            2021090701 ; serial
            21600      ; refresh after 6 hours
            3600       ; retry after 1 hour
            604800     ; expire after 1 week
            86400 )    ; minimum TTL of 1 day
;
;
        IN NS   dns1.example.com.
        IN NS   dns2.example.com.
dns1    IN A    10.0.1.1
dns2    IN A    10.0.1.2
;
;
;
@       IN MX   10  mail.example.com.
mail    IN A    10.0.1.5
;
;
; This sample zone file illustrates sharing the same IP addresses for multiple services:
;
services    IN A    10.0.1.10

ftp         IN CNAME  services.example.com.
www         IN CNAME  services.example.com.
