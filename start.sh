./stop.sh
mkdir -p key
ssh-keygen -t ecdsa-sk -f ./key/my-ecdsa-sk -N '' <<< '\ny'
docker-compose build 
docker-compose up -d
SSH_AUTH_SOCK=. ssh -o "PasswordAuthentication=no" -o "IdentitiesOnly=yes" -o "StrictHostKeyChecking=No" -p 2222 -i ./key/my-ecdsa-sk root@localhost
