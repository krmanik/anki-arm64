# anki-arm64

Building and running latest Anki on arm64 linux.

# Install latest Anki on arm64 linux
## Install on Arch Linux
### 1. Install required packages
```
pacman -Sy --noconfirm python-pyqt5 python-pyqtwebengine
```
### 2. Download anki and aqt wheel from release page
- [aqt-2.1.47-py3-none-any.whl](https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-archarm/aqt-2.1.47-py3-none-any.whl)
- [anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl](https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-archarm/anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl)

```
wget https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-archarm/aqt-2.1.47-py3-none-any.whl

wget https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-archarm/anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
```

### 3. Install the wheel using pip
Note: Install first anki then aqt wheel

```
pip install anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
pip install aqt-2.1.47-py3-none-any.whl
```
### 4. Run anki
```
anki
```

### 5. Add shortcut 
Download this repository and copy anki.desktop to `/usr/share/applications/` and copy anki.png to `/usr/share/pixmaps/`.

Also command can be run to copy these files.

```
mv anki.desktop /usr/share/applications/anki.desktop
mv anki.png /usr/share/pixmaps/anki.png
```

## Install latest Anki on Ubuntu 20.04
### 1. Install required packages
```
apt install python3-pyqt5 python3-pyqt5.qtwebengine python3-pip
```

### 2. Download anki and aqt wheel from release page
- [aqt-2.1.47-py3-none-any.whl](https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-ubuntu20.04/aqt-2.1.47-py3-none-any.whl)
- [anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl](https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-ubuntu20.04/anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl)

```
wget https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-ubuntu20.04/aqt-2.1.47-py3-none-any.whl

wget https://github.com/infinyte7/anki-arm64/releases/download/v0.0.1-ubuntu20.04/anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
```

### 3. Install the wheel using pip
Note: Install first anki then aqt wheel

```
pip install anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
pip install aqt-2.1.47-py3-none-any.whl
```
### 4. Run anki
```
anki
```

### 5. Add shortcut 
Download this repository and copy anki.desktop to `/usr/share/applications/` and copy anki.png to `/usr/share/pixmaps/`.

Also command can be run to copy these files.

```
mv anki.desktop /usr/share/applications/anki.desktop
mv anki.png /usr/share/pixmaps/anki.png
```


# Building latest Anki from source
## Build on Arch Linux
### 1. Install required packages
```
pacman -Sy --noconfirm rsync curl git rust cargo nodejs

pacman -Sy --noconfirm python-pyqt5 python-pyqt3d python-pyqt5-networkauth python-pyqtchart python-pyqtdatavisualization python-pyqtpurchasing python-pyqtwebengine

pacman -Sy --noconfirm --needed base-devel
```

### 2. Build latest Anki
```
export BAZELISK_VER=1.9.0

curl -L https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VER}/bazelisk-linux-arm64 -o ./bazel

chmod +x bazel && mv bazel /usr/local/bin/

git clone --depth=1 https://github.com/ankitects/anki

cd anki

echo "build --action_env=PYTHON_SITE_PACKAGES=/usr/lib/python3.9/site-packages" >> user.bazelrc

rm -rf bazel-dist

bazel build -k --config opt dist
```

After build completed, there are two wheel file in bazel-dist which can be shared with others. 
```
aqt-2.1.47-py3-none-any.whl
anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
```

## Build on Ubuntu-20.04
### 1. Install required packages
```
apt-get update -q -y 
apt-get install -q -y apt-utils git rsync findutils curl gcc g++ rustc cargo nodejs
apt-get install -q -y python3 python3-pip python3-pyqt5 pyqt5-dev-tools
apt-get install -q -y python-is-python3
```

### 2. Build latest Anki
```
export BAZELISK_VER=1.9.0

curl -L https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VER}/bazelisk-linux-arm64 -o ./bazel

chmod +x bazel && mv bazel /usr/local/bin/

git clone --depth=1 https://github.com/ankitects/anki

cd anki

echo "build --action_env=PYTHON_SITE_PACKAGES=/usr/lib/python3/dist-packages" >> user.bazelrc

rm -rf bazel-dist

bazel build -k --config opt dist
```

After build completed, there are two wheel file in bazel-dist which can be shared with others. 
```
aqt-2.1.47-py3-none-any.whl
anki-2.1.47-cp38-abi3-manylinux2014_aarch64.whl
```

# Contributors
- [sudomain](https://github.com/sudomain)