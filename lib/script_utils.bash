# Check if a command exists; useful for bash utils that depend on external programs
cmd_exists()
{
    hash $1 2>/dev/null
}

# Echo a message to the error stream.  This is pretty simple, but handy if you're not
# used to programming bash
echo_error()
{
    echo >&2 $1
}