trap 'echo "Be patient"' INT TERM KILL

for ((n=20; n; n--))
do
    echo "Testign - $n"
    sleep 5
done
