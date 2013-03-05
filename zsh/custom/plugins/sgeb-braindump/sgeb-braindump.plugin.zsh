# Search in braindumps
function bd()
{
    if [[ $# == 0 ]]; then
        echo "$0: please provide a search term." >/dev/stderr
        return 1
    fi

    PATTERN="/$1/$(printf ' && /%s/' "${@:2}")"

    gawk '
        BEGIN {
            RS = "\n===\n";
            FS = "\n===\n";
            OFS = "";
            ORS = "";
            IGNORECASE = 1;
            rc = 2;
        }

        BEGINFILE {
            fnprinted = 0;
        }

        '"$PATTERN"' {
            rc = 0;
            if (fnprinted == 0) {
                print "===\n>>> " FILENAME "\n";
                fnprinted = 1;
            }
            print "===\n" $0 "\n";
        }

        END {
            if (rc == 0)
                print "===\n";
            exit rc;
        }
    ' ~/usr/braindump/**.txt

    return $?
}
