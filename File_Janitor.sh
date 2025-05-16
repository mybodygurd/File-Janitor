#!/usr/bin/env bash

main() {
    echo -e "File Janitor 2025\nPowered by Bash\n"

    CURRENT_DIR=$(pwd)
    SCRIPT_NAME=$(basename $0)

    case $1 in
        "help")
            if [ -f "file-janitor-help.txt" ]; then
                cat "file-janitor-help.txt"
            else
                echo "Help file not found"
                return 1
            fi
            ;;
        "list")
            if [ -z "$2" ]; then
                echo "Listing files in $CURRENT_DIR"
                ls -a1 | sort

            else
                if [ ! -e "$2" ]; then
                    echo "'$2' is not found"
                elif [ ! -d "$2" ]; then
                    echo "'$2' is not a directory"
                else
                    echo "Listing files in '$2'"
                    ls -a1 "$2" | sort
                fi
            fi
            ;;
        *)
            echo "Type $SCRIPT_NAME help to see available options"
            return 1
            ;;
    esac

}
main "$@"

    # elif [ "$1" = "list" -a -z "$2" ]; then
    #     echo "Listing files in $CURRENT_DIR"
    #     ls -a1 | sort

    # elif [ "$1" = list -a -n "$2" ]; then
    #     if [ -e "$2" ]; then
    #         if [ -d "$2" ]; then
    #             echo "Listing files in '$2'"
    #             ls -a1h "$2" | sort
    #         else
    #             echo "'$2' is not a directory"
    #         fi
    #     else
    #         echo "'$2' is not found"
    #     fi
    # else
    #     echo "Type $SCRIPT_NAME help to see available options"
    # fi