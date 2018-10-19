# gitolite-installer
*git* ユーザを作成し, */home/git/* にgitolite を建てます.

## Usage

example
```sh
$ git clone https://github.com/shirot7335/gitolite-installer.git
$ cd gitolite-installer

### sample1
$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa): gitolite_admin
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
$ sudo sh ./gitolite.sh

### sample2
$ sudo sh ./gitolite.sh -k /path/to/key/xxx.pub
```
