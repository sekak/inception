
echo "check is directory does not existe"

if [ ! -d "/home/med/data" ]
then
    sudo mkdir /home/med/data
    sudo mkdir /home/med/data/wordpress
    sudo mkdir /home/med/data/database
    sudo mkdir /home/med/data/static
fi