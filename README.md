# Repack Win 10 ISO
## Ubuntu / Debian: Repacks MSDN Win10 to VL w/Lic, KMS, and Spice
```bash
# Install deps
sudo apt install mkisofs genisoimg -y

# Clone and enter directory
git clone https://github.com/sawyermade/win10_repack
cd win10_repack

# Mount iso, copy files, creates ./win10_repack.iso
./create_bootable_win10.sh /path/to/original/win10.iso
```
