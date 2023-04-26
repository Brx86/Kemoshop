#!/usr/bin/env bash

direrr() {
    echo -e "\e[41m[ERROR] You should run me under \e[1;33mthe root of this repository.\e[0m"
    exit 1
}

[[ -d "art" ]] || direrr
[[ -d "text" ]] || direrr

for doc in art/*.md
do
    echo Converting "'${doc:4}'" ...
    cat > "text/${doc:4:-3}.html" <<EOF
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="兽耳超市">
    <link rel="icon" href="/static/favicon.ico">
    <title>Kemo Shop | 兽耳超市</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1.5.0/css/pico.min.css">
    <link rel="stylesheet" href="/static/style.css">
    <style>
        #view {
            text-align: left;
        }
    </style>
</head>

<body>
    <main class="container">
        <h1>Kemo Shop | <a href="/text">Text memes</a></h1>
        <article id="view">
            <github-md>
EOF
    cat "$doc" >> "text/${doc:4:-3}.html"
    cat >> "text/${doc:4:-3}.html" <<EOF
            </github-md>
        </article>

        <footer id="footer">
            <p>** Footer **</p>
        </footer>
    </main>
</body>
<script src="https://cdn.jsdelivr.net/gh/MarketingPipeline/Markdown-Tag/markdown-tag.js"></script> 

</html>
EOF
done
