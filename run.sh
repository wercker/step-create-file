if [ -z "$WERCKER_CREATE_FILE_FILENAME" ]
then
    fail 'missing filename option, please add this the create-file step in wercker.yml'
fi

if [ -z "$WERCKER_CREATE_FILE_CONTENT" ]
then
    fail 'missing content option, will create an empty file.'
fi

if [ -e "$WERCKER_CREATE_FILE_FILENAME" ]
then
    if [[ ! -e "$WERCKER_CREATE_FILE_OVERWRITE" && "$WERCKER_CREATE_FILE_OVERWRITE" = "true" ]]
    then
        debug "file \"$WERCKER_CREATE_FILE_FILENAME\" already exists and will be overwritten because overwrite option is set to true"
    else
        fail "cannot create file, $WERCKER_CREATE_FILE_FILENAME already exists."
    fi
fi

echo -e "$WERCKER_CREATE_FILE_CONTENT" > $WERCKER_CREATE_FILE_FILENAME
if [ "$WERCKER_CREATE_FILE_HIDE_FROM_LOG" = "true" ]
then
    debug "$(cat $WERCKER_CREATE_FILE_FILENAME)"
fi


success "content written to $WERCKER_CREATE_FILE_FILENAME"
