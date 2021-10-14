#! /usr/bin/env python2

import subprocess
import os.path

cache_location = "~/dotfiles/"

# def get_pass(account=None):

#     encrypted_file = cache_location + account + ".password.gpg"
#     encrypted_file = os.path.expanduser(encrypted_file)

#     command = [
#         "gpg",
#         "--quiet",
#         "--no-tty",
#         "--for-your-eyes-only",
#         "--decrypt",
#         encrypted_file]

#     password = subprocess.check_output(command).decode('utf-8').strip('\n')

#     return password

def get_credentials(account=None, 
                    credential_type=None, 
                    directory="~/dotfiles/"):
    """ Get login credentials for an email account.

    Parameters:
    account: prefix on encrypted filename
    credential_type: "user:, "password"
    directory: where to find encrypted file
    """

    encrypted_file = directory + account + "." + credential_type + ".gpg"
    encrypted_file = os.path.expanduser(encrypted_file)

    command = [
        "gpg",
        "--quiet",
        "--no-tty",
        "--for-your-eyes-only",
        "--decrypt",
        encrypted_file]

    password = subprocess.check_output(command).decode('utf-8').strip('\n')

    return password
