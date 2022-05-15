wget -N https://raw.githubusercontent.com/Misaka-blog/AX/main/web
chmod +x ./web

if [[ -z $type ]]; then
    type="trojan"
fi

if [[ -z $password ]]; then
    password="1eb6e917-774b-4a84-aff6-b058577c60a5"
fi

cat <<EOF > ~/config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "$type",
            "settings": {
                "clients": [
                    {
                        "password": "$password",
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

./web -config=config.json