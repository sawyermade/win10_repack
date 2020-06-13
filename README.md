# Repack Win 10 ISO mkisofs / genisoimage
## Ubuntu / Debian: Repacks MSDN Win10 Pro to VL w/Lic, KMS, and Spice

KMS and Spice in tools/
```bash
# Install deps
sudo apt install mkisofs genisoimage -y

# Clone and enter directory
git clone https://github.com/sawyermade/win10_repack
cd win10_repack

# Download og iso, mount og iso, copy files, creates ./win10_repack.iso
bash ./repack_win10.sh
```
