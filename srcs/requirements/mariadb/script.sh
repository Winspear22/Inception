sudo docker build -t srcs_mariadb . >/dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "srcs_mariadb part is builded âœ…"
    else
        echo "ERROR:"
        echo "---"
        echo " "
        sudo docker build -t srcs_mariadb .
        echo " "
        echo "---"
        echo "Solve this problem, srcs_mariadb is not builded âŒ"
        exit 1
    fi
      
echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit' to stop container"
    sudo docker run -it srcs_mariadb
else
    sudo docker run srcs_mariadb
fi