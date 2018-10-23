# Danger Cove

This is the [home page at dangercove.com](https://www.dangercove.com). It uses [Jekyll](https://jekyllrb.com/) with the [Bulma](https://bulma.io) CSS framework on top.

I try to keep this site straightforward and easy to maintain. Vanilla Jekyll and Bulma make this a breeze.

## Development

Here's how to get the project up and running.

### Installing dependencies

The only requirements are listed in the `Gemfile`.

```bash
$ bundle install
```

### Running the project

```bash
$ bundle exec rake serve
```

## Deployment

Deploying the site builds it with the `JEKYLL_ENV` environment variable set to `production`. It then gets the remote path from the `REMOTE_PATH` environment variable and uses `rsync` to copy the files over.

```bash
$ bundle exec rake deploy
```

### Setting the `REMOTE_PATH`

You could add it the command each time you run it:

```bash
$ REMOTE_PATH=account@example.com:/some/path bundle exec jekyll deploy
```

A more convenient solution would be to create a `.env` file and store the path there:

```bash
$ echo 'REMOTE_PATH=account@example.com:/some/path' >> .env
```

After that, just run:

```bash
$ bundle exec jekyll deploy
```
