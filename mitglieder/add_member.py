#!/usr/bin/env python3
import datetime
import subprocess
import os
import sqlite3
import functools

DB_NAME = 'memberdb.sqlite'

def umlaut_to_ascii(s):
    return s.replace("ä", "ae").replace("ö", "oe").replace("ü", "ue")

def add_member():
    first_name = input('First name: ')
    last_name = input('Last name: ')
    email = '{0}.{1}@ost.ch'.format(first_name.lower(), last_name.lower())
    specific_email = umlaut_to_ascii(input('E-Mail ({0}): '.format(email)))
    if len(specific_email) > 0:
        email = specific_email
    gender = input('Gender (m/w/n): ')
    github = input('Github User (optional): ')
    github = github or None
    newsletter = input('Newsletter (Y/n): ')
    newsletter = 1 if (newsletter or "y").lower() == 'y' else 0
    today = datetime.date.today()

    conn = sqlite3.connect(DB_NAME)
    conn.row_factory = sqlite3.Row
    c = conn.cursor()

    # TODO: since
    c.execute('''INSERT INTO members (first_name, last_name, email, gender, github, active, since, newsletter)
              VALUES (?, ?, ?, ?, ?, ?, ?, ?);''', (first_name, last_name, email,
                                              gender, github, 1,
                                              today.strftime("%Y-%m-%d"), newsletter))
    c.execute("SELECT * FROM members WHERE ID = (SELECT MAX(ID)  FROM members);")
    row = c.fetchone()

    print("Newly added member:")
    print(functools.reduce(lambda p, n: p + '{0}="{1}" '.format(n[0], n[1]),
          zip(row.keys(), tuple(row)), ''))

    conn.commit()
    c.close()
    print("Member has been added.")


def confirm(message):
    return input(message + ' (y/N)').lower() == 'y'


def read_passphrase():
    return subprocess.run('pass openost/verein/memberdb',
                          shell=True,
                          check=True,
                          stdout=subprocess.PIPE).stdout.decode()[:-1]


def main():
    if os.path.exists(DB_NAME):
        if confirm('Decrypt DB?'):
            os.unlink(DB_NAME)

    if not os.path.exists(DB_NAME):
        passphrase = read_passphrase()
        subprocess.run('gpg2 --output memberdb.sqlite --batch '
                       '--passphrase-fd 0 --decrypt memberdb.sqlite.gpg',
                       shell=True,
                       input=passphrase.encode(),
                       check=True
                       )

    while confirm('Add (another) new member?'):
        add_member()

    if confirm('Encrypt DB?'):
        passphrase = read_passphrase()
        os.unlink(DB_NAME + '.gpg')
        subprocess.run('gpg2 --symmetric --batch --passphrase-fd 0 memberdb.sqlite',
                       shell=True,
                       input=passphrase.encode(),
                       check=True,
                       )


if __name__ == '__main__':
    main()
