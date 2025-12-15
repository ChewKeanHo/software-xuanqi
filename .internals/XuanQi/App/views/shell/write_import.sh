#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# Parameters:
#       ____path_dest
#               - COMPULSORY
#               - the destination file to write into.
#       ____lists
#               - OPTIONAL
#               - the shell script importing filepaths list.
#               - multi-lines value where each line is an entry.
#               - recommended absolute pathing. Relative pathing is
#                 acceptable as long as you know what you're doing.
#               - do nothing if left empty.
# Outputs:
#       Write to '$____path_dest' File
#               - the rendered output written into file.
#               - no action on error.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
#               - error on empty/invalid '$____path_dest'.
#               - error on invalid '$____indent' (e.g. not a number).
#               - error on bad execution.
views_shell_write_import() {
        #____path_dest="$1"
        #____lists="$2"


        # validate inputs
        if [ "$1" = "" ]; then
                return 1
        fi

        if [ ! "${1%/*}" = "$1" ]; then
                if [ -d "${1%/*}" ]; then
                        : # accepted
                elif [ -L "${1%/*}" ] &&
                [ -d "$(readlink --canonicalize "$1")" ]; then
                        : # accepted
                else
                        return 1
                fi
        fi

        if [ "$2" = "" ]; then
                return 0
        fi


        # execute
        ## write opener
        printf -- "%s" "\
____old_IFS=\"\$IFS\"
while IFS= read -r ____library || [ -n \"\$____library\" ]; do
        . \"\$____library\"
        if [ \$? -ne 0 ]; then
                IFS=\"\$____old_IFS\"
                unset ____library ____old_IFS
                1>&2 printf -- \"%s\" \"\\
E: From '${1##*/}': Failed to Import '\${____library}'.
E: Unable to Proceed.
E: Contact Developer or Maintainer.
E: Bailing Out...

\"
                return 1
        fi
done <<EOF
"  >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi

        ## write list
        ____old_IFS="$IFS"
        while IFS= read -r ____library || [ -n "$____library" ]; do
                if [ "$____library" = "" ]; then
                        continue
                fi

                printf -- "%s" "\
${____library}
"  >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        IFS="$____old_IFS"
                        unset ____library ____old_IFS
                        return 1
                fi
        done<<EOF
${2}
EOF
        IFS="$____old_IFS"
        unset ____library ____old_IFS

        ## write closer
        printf -- "%s" "\
EOF
IFS=\"\$____old_IFS\"
unset ____library ____old_IFS
"  >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0
