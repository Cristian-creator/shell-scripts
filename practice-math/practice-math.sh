LOWER_LIMIT=$1
UPPER_LIMIT=$2
OPERATION_NOT_PERMITTED=1

echo "Welcome, $USER!"

output_start_game() {
    echo "When you are ready to start, type GO > "
}

start_game() {
    echo "game started"
    
    WRONG_ANSWERS=0

    for item in `seq 5`
        do
            # generate numbers
            NUM1=`shuf -i $LOWER_LIMIT-$UPPER_LIMIT -n 1`
            NUM2=`shuf -i $LOWER_LIMIT-$UPPER_LIMIT -n 1`
        
            # generate operator
            # OPERATOR=''
            INDEX_OF_OPERATOR=`shuf -i 0-4 -n 1`
            RESULT=10

            case $INDEX_OF_OPERATOR in 
                0)
                  OPERATOR='+'
                  RESULT=`expr $NUM1 + $NUM2`
                  ;;
                1)
                  OPERATOR='-'
                  RESULT=`expr $NUM1 - $NUM2`
                  ;;
                2)
                  OPERATOR='*'
                  RESULT=`expr $NUM1 \* $NUM2`
                  ;;
                3)
                  OPERATOR='/'  
                  RESULT=`expr $NUM1 / $NUM2`
                  ;;
                4)
                  OPERATOR='%'
                  RESULT=`expr $NUM1 % $NUM2`
                  ;;
            esac

            echo "$NUM1 $OPERATOR $NUM2 = "

            read REPLY;

            if [ "$REPLY" -ne "$RESULT" ]
                then WRONG_ANSWERS=`expr $WRONG_ANSWERS + 1`
            fi
        done
    echo "wrong answers: $WRONG_ANSWERS"

    exit 1
}

if [ $# -ne 2 ]; then
    echo -e "\nUsage:\t$0 START END\n"
    exit OPERATION_NOT_PERMITTED
else 

    output_start_game
    
    while true; do
        
        read REPLY;

        if [ "$REPLY" = "GO" ]
            then start_game
        else 
            output_start_game
        fi

    done
fi