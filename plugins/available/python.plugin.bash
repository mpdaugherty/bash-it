cite about-plugin
about-plugin 'alias "http" to SimpleHTTPServer and add pycheckers program'

if [ $(uname) = "Linux" ]
then
  alias http='python2 -m SimpleHTTPServer'
else
  alias http='python -m SimpleHTTPServer'
fi

pycheckers_disabled ()
{
    # Linting for python.  Can be integrated with emacs flymake for dynamic linting:
    # https://bitbucket.org/jek/sandbox/src/tip/pycheckers
    #
    # Usage:
    #   pycheckers file.py

    # If pyflakes is not installed, warn the user
    if ! (cmd_exists pyflakes)
    then
        echo_error 'pyflakes is not installed.  You can improve the output of pycheckers by installing it.'
        echo_error 'More information: http://pypi.python.org/pypi/pyflakes'
        echo_error ''
        echo_error '  > sudo pip install pyflakes'
        echo_error ''
    else
        pyflakes "$1"
    fi

    # If pep8 is not installed, warn the user
    if ! (cmd_exists pep8)
    then
        echo_error 'pep8 is not installed.  You can improve the output of pycheckers by installing it.'
        echo_error 'More information: http://pypi.python.org/pypi/pep8'
        echo_error ''
        echo_error '  > sudo pip install pep8'
        echo_error ''
    else
        # E202: whitespace before ')'
        # E221: multiple spaces before operator
        # All options are found here: https://github.com/jcrocholl/pep8/blob/master/pep8.py
        pep8 --ignore=E202,E221 --repeat "$1"
    fi
    true
}