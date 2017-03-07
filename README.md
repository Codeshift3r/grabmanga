# Grabmanga

Command-line utility to download manga bulkly from various sources


`Note : ` I wrote this a long time ago.. 2012 maybe. So there's probably lots of bugs.Just putting them here if
anyone wants to add/work on it.

`Note 2 : ` There is no scraping strategy, it just predicts file path and patterns based on educated guess since I just need speed at the time and didn't bother scraping the pages for `img` tags or whatnot. If it got rewritten, I'd be sure to add a scraping engine
and wrote it in a more readble way/more scaleable.


## Prerequisite

wget for windows. You can get it [here](https://eternallybored.org/misc/wget/) You just need the single `wget.exe` file.
if wget returns some missing dlls error, just download the missing dlls and place them at `c:\windows\system32\`

## Quirks

- If the manga title have space(s) in them, refer the `space` variable in the host file (eg: goodmanga.bat) to know
which character you need to replace for the spaces.

- The [limit] parameter is used to limit the pages downloaded for each chapter, so if your manga usually have
28 page per chapter, put limit around 30 or 35 just to be safe.

## Usage

```
H:\CLI\grabmanga>grabmanga --help
┌────────────────────────┐
│ Grabmanga v1.0b │ 2013 │
└────────────────────────┘

[!] Usage:
grabmanga [host] [manga] [from chapter] [to chapter] [limit]
eg : grabmanga mangable one_Piece 100 110 20

[?] Explaination
[host] the host you wish to download from
[manga] the manga you wish to download
[from chapter] the starting chapter you wish to download
[to chapter] the last chapter you want to download
[limit] the page limit of each chapter


H:\CLI\grabmanga>grabmanga goodmanga bleach 500 501 30
[english] Space substitution is _
[!] Checking for zero type Filename...
[Y] bleach chapter 500 (1.jpg)
[Y] bleach chapter 500 (2.jpg)
[Y] bleach chapter 500 (3.jpg)
[Y] bleach chapter 500 (4.jpg)
[Y] bleach chapter 500 (5.jpg)
[Y] bleach chapter 500 (6.jpg)
[Y] bleach chapter 500 (7.jpg)
[Y] bleach chapter 500 (8.jpg)
[Y] bleach chapter 500 (9.jpg)
[Y] bleach chapter 500 (10.jpg)
[Y] bleach chapter 500 (11.jpg)
[Y] bleach chapter 500 (12.jpg)
[Y] bleach chapter 500 (13.jpg)
[Y] bleach chapter 500 (14.jpg)
[Y] bleach chapter 500 (15.jpg)
[Y] bleach chapter 500 (16.jpg)
[Y] bleach chapter 500 (17.jpg)
[Y] bleach chapter 500 (18.jpg)
[Y] bleach chapter 500 (19.jpg)
[Y] bleach chapter 500 (20.jpg)
[Y] bleach chapter 500 (21.jpg)
[Y] bleach chapter 500 (22.jpg)
[Y] bleach chapter 500 (23.jpg)
[X] bleach chapter 500 (24.jpg)
[X] bleach chapter 500 (25.jpg)
[X] bleach chapter 500 (26.jpg)
[X] bleach chapter 500 (27.jpg)
[X] bleach chapter 500 (28.jpg)
[X] bleach chapter 500 (29.jpg)
[X] bleach chapter 500 (30.jpg)
[english] Space substitution is _
[!] Checking for zero type Filename...
[X] bleach chapter 501 (1.jpg)
[X] bleach chapter 501 (2.jpg)
[X] bleach chapter 501 (3.jpg)
[X] bleach chapter 501 (4.jpg)
[X] bleach chapter 501 (5.jpg)
[X] bleach chapter 501 (6.jpg)
[X] bleach chapter 501 (7.jpg)
[X] bleach chapter 501 (8.jpg)
[X] bleach chapter 501 (9.jpg)
[X] bleach chapter 501 (10.jpg)
[X] bleach chapter 501 (11.jpg)
[X] bleach chapter 501 (12.jpg)
[X] bleach chapter 501 (13.jpg)
[X] bleach chapter 501 (14.jpg)
[X] bleach chapter 501 (15.jpg)
[X] bleach chapter 501 (16.jpg)
[X] bleach chapter 501 (17.jpg)
[X] bleach chapter 501 (18.jpg)
[X] bleach chapter 501 (19.jpg)
[X] bleach chapter 501 (20.jpg)
[X] bleach chapter 501 (21.jpg)
[X] bleach chapter 501 (22.jpg)
[X] bleach chapter 501 (23.jpg)
[X] bleach chapter 501 (24.jpg)
[X] bleach chapter 501 (25.jpg)
[X] bleach chapter 501 (26.jpg)
[X] bleach chapter 501 (27.jpg)
[X] bleach chapter 501 (28.jpg)
[X] bleach chapter 501 (29.jpg)
[X] bleach chapter 501 (30.jpg)

[Y] From goodmanga.net bleach Chapter 500 until 501
[Y] Completed at  1:17:29.13 on Wed 05/10/2017 by user


H:\CLI\grabmanga>

```
