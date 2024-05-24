
# openaudible-organizer

A simple automatic organizer written in bash script for openaudible libraries. The organizer watches the openaudible library and mirrors files by hardlinking them into an organized library.

## Usage/Examples

There are two ways to use the script. As a docker container or use of the script directly. The recommended way is using docker.

### Docker Example

```console
$ docker run -v "/mnt/media-data:/media" ghcr.io/joker9944/openaudible-organizer:latest /media/openaudible /media/Audiobooks
```

### Script Help

```console
$ docker run --rm ghcr.io/joker9944/openaudible-organizer:latest --help
usage: openaudible-organizer [options] openaudible_library_dir organised_library_dir
     -h|--help                  Displays this help
     -c|--copy                  Copy files insted of hardlinking
     -v|--verbose               Displays verbose output
    -nc|--no-colour             Disables colour output
    -cr|--cron                  Run silently unless we encounter an error
```

## Caveats

By default the organizer works by [hardlinking](https://en.wikipedia.org/wiki/Hard_link) files.

This imposes a few requirements, namely:

* The filesystem must support hardlinks
* The link source and target must be on the same filesystem

If your setup does not meet this requirements there is the option to copy files instead of linking.

### Docker Copy Example

```bash
$ docker run -v "/mnt/media-data:/media" ghcr.io/joker9944/openaudible-organizer:latest --copy /media/openaudible /media/Audiobooks
```

## Motivation

This project has been done a few times now in different languages. But all existing solutions either just copy the files which doubles the size of the library or require some manual steps each time the library should be organized. I disliked both downsides so I cooked up a solution which solves these issues.

## Acknowledgments

Inspirations and related projects

* [bash-script-template](https://github.com/ralish/bash-script-template) Template for this project
* [openaudible-audiobookshelf-watcher](https://github.com/victorbutler/openaudible-audiobookshelf-watcher) Similar project writen in TypeScript
* [openaudible-create-author-directories](https://github.com/danielmbond/openaudible-create-author-directories) Similar project writen in PowerShell
* [OpenAudible Book Organizer](https://github.com/orbitalteapot/OpenAudible-BookOrganizer) Similar project writen in C#
