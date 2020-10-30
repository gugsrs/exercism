#!/usr/bin/env bash
main () {
    while getopts "nlivx" flag; do
        case $flag in
            n) show_line_number=true ;;
            l) show_file_name=true ;;
            i) case_insensitivy=true ;;
            v) invert=true ;;
            x) match_line=true ;;
        esac
    done

    shift $((OPTIND - 1))

    if [[ ${#@} -gt 2 ]]; then
        multiple_files=true
    fi

    for i in "${@:2}"; do
        line_number=1
        while read -r line; do
            original_line=$line;
            pattern=$1
            search_line "$pattern" $line
            if [[ -n $matched_line ]]; then
                result=""
                if [ "$show_file_name" = "true" ] || [ "$multiple_files" = "true" ]; then
                    result="$i:"
                fi
                if [ "$show_line_number" = "true" ]; then
                    result+="${line_number}:"
                fi
                if [ "$show_file_name" = "true" ]; then
                    echo "$i"
                    break
                else
                    result+="${original_line}"
                    echo "$result"
                fi
            fi
            line_number=$(( line_number + 1))
        done < $i
    done
}

search_line() {
    matched_line=""
    if [ "$case_insensitivy" = "true" ]; then
        line=`echo $line | tr '[:upper:]' '[:lower:]'`
        pattern=`echo $1 | tr '[:upper:]' '[:lower:]'`
    fi
    if [ "$match_line" = "true" ]; then
        if [[ $line == $pattern ]]; then
            if [ "$invert" != "true" ]; then
                matched_line=$2
            fi
        elif [ "$invert" = "true" ]; then
            if [ "$invert" == "true" ]; then
                matched_line=$2
            fi
        fi
    else
        if [[ $line =~ $pattern ]]; then
            if [ "$invert" != "true" ]; then
                matched_line=$2
            fi
        elif [ "$invert" = "true" ]; then
            if [ "$invert" == "true" ]; then
                matched_line=$2
            fi
        fi
    fi
}

main "$@"
