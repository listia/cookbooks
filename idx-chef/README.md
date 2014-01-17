idx Cookbook
============
## Usage

### Build cookbooks
```
$ gem install bundler
$ bundle install
$ librarian-chef install
```

### Install chef:
```
$ sudo apt-get install -y curl
$ curl -L https://www.opscode.com/chef/install.sh | bash
```

### Run it
Tweak `node.json` to add/remove monitor tasks to run list, then :

`$ sudo chef-solo -c solo.rb`


