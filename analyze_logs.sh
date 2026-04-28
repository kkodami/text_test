

cat <<EOL > access.log
192.168.1.1 - - [28/Jul/2024:12:34:56 +0000] "GET /index.html HTTP/1.1" 200 1234
192.168.1.2 - - [28/Jul/2024:12:35:56 +0000] "POST /login HTTP/1.1" 200 567
192.168.1.3 - - [28/Jul/2024:12:36:56 +0000] "GET /home HTTP/1.1" 404 890
192.168.1.1 - - [28/Jul/2024:12:37:56 +0000] "GET /index.html HTTP/1.1" 200 1234
192.168.1.4 - - [28/Jul/2024:12:38:56 +0000] "GET /about HTTP/1.1" 200 432
192.168.1.2 - - [28/Jul/2024:12:39:56 +0000] "GET /index.html HTTP/1.1" 200 1234
EOL


TOTAL=$(wc -l < access.log)


UNIQUE_IPS=$(awk '!seen[$1]++ {count++} END {print count}' access.log)

METHODS=$(awk '{gsub(/"/, "", $6); methods[$6]++} END {for (m in methods) print "  " m ": " methods[m]}' access.log | sort)


TOP_URL=$(awk '{urls[$7]++} END {max=0; for (u in urls) if (urls[u] > max) {max=urls[u]; top=u} print top " (" max " запросов)"}' access.log)


{
    echo "============================================"
    echo "         Log Analysis Report"
    echo "============================================"
    echo ""
    echo "Total Requests: $TOTAL"
    echo ""
    echo "Unique IP Addresses: $UNIQUE_IPS"
    echo ""
    echo "Requests by Method:"
    echo "$METHODS"
    echo ""
    echo "Most Popular URL:"
    echo "  $TOP_URL"
    echo ""
    echo "============================================"
} > report.txt

echo "Отчёт сформирован: report.txt"
cat report.txt
