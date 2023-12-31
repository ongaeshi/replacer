# Replacer

Replace the clipboard contents based on the contents of replacer.yml.

![image](https://github.com/ongaeshi/replacer/assets/154418/eb32dabb-3fd4-4857-b3f8-7344d872b8e1)

## Install

Need [runa](https://github.com/ongaeshi/runa).

```
$ gem install runa
```

Install replacer.

```
$ git clone https://github.com/ongaeshi/replacer
$ cd replacer
$ runa install
$ runa deploy replacer.rb /path/to/bin
```

## Usage

### Edit replacement list

```
$ replacer --edit
```

OR edit `replacer.yml` file directly.

### Replace clipboard

Copy the text you want to replace to the clipboard.

```
$ replacer
```

## Demo

![GIF 2023-07-31 1-01-22](https://github.com/ongaeshi/replacer/assets/154418/c51b3c72-7f06-4db0-804c-bd0f190a975b)


