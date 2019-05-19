**BACKUP THE SITE BEFORE DOING THIS!**

- Download this script:

Release versions:

https://github.com/interconnectit/Search-Replace-DB/releases

Direct link to latest version:

https://github.com/interconnectit/Search-Replace-DB/archive/master.zip

2. Unzip/untar it
3. Upload it to the root directory of the site in it’s own little folder (preferably renamed for security)
4. Visit the URL of that folder (`sitename.com/FOLDER/`)
5. In the exclude field, add `guid` so it skips that table

### Now to the good stuff!

- Search for:
`sitename.com`

- Replace with:
`www.sitename.com`

Or if you wanted the non-www version to be the main url, do the opposite:

- Search for:
`www.sitename.com`

- Replace with:
`sitename.com`

If you built the site on an IP address, you would do:
 
- Search for:
`33.44.55.66`
- Replace with:
`www.sitename.com` or `sitename.com`


Note:

- Leave off the http/https and any slashes.

- You shouldn't need to use regex.


Good luck!
