sync {
   default.rsync,
   source = "/home/vagrant/tmp/foo",
   target = "/home/vagrant/tmp/bar",
   excludeFrom="/home/vagrant/tmp/foo/.gitignore"
}