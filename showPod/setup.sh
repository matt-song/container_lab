version="v1.0"
indexFile="/usr/share/nginx/html/index.html"

echo -e "<pre>\n=== Matt's test pod, version <$version> ===\n" > $indexFile
echo -e "Hostname: \t`hostname`" >> $indexFile
cat /proc/net/fib_trie | grep -B1 "/32 host LOCAL" | grep "|" | grep -v "127.0.0.1" | sort -u | awk '{print "IPAddress: \t"$2}' >> $indexFile
env | grep "NGINX_VERSION" | sed 's/NGINX_VERSION/NginxVersion/g'| sed 's/=/: \t/g' >> $indexFile
echo -e "\n</pre>" >> $indexFile
