# Open\OST Newsletters

## Sending Newsletters

1. Clone this repository
2. Clone the [Verein repository](https://github.com/openhsr/verein)
3. Decrypt the member db (checkout the [README](https://github.com/openhsr/verein/tree/master/mitglieder))
4. Install nele

    ```bash
    pip3 install nele
    ```
5. Create a new file in the `archiv` directory and write your Newsletter in there (don't forget the  frontmatter header!)
6. Send a draft to yourself

    ```bash
    nele draft archiv/<file>.md
    ```

7. Send an email to EVERYONE (!!!)

    ```bash
    nele send
    ```
