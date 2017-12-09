cwd=$PWD

destination=$HOME/.local/share/gnome-shell/extensions/
mkdir -p $destination

timestamp=`date +%s`
tmpdir=tmpdir$timestamp
mkdir $tmpdir && cd $tmpdir

curl -s https://api.github.com/repos/zakkak/workspace-grid/releases/latest \
  | grep tarball_url \
  | cut -d '"' -f 4 \
  | wget -qi - -O workspace-grid-latest.tar.gz

tar xf workspace-grid-latest.tar.gz

glib-compile-schemas zakkak-workspace-grid-3f250e8/workspace-grid@mathematical.coffee.gmail.com/schemas/

cp -r */workspace-grid@mathematical.coffee.gmail.com $destination

cd $cwd
rm -r $tmpdir
