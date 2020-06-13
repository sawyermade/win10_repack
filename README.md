# Repack Windows 10 ISO mkisofs / genisoimage
## Ubuntu / Debian: Repacks MSDN Win10 Pro to VL w/Lic, KMS, and Spice

ISO: https://www.microsoft.com/en-us/software-download/windows10ISO
```bash
# Install deps
sudo apt install mkisofs genisoimage curl -y

# Clone and enter directory
git clone https://github.com/sawyermade/win10_repack
cd win10_repack

# Download og iso, mount og iso, copy files, creates ./windows_10_pro_x64_vl-2004_REPACK.iso
bash repack_win10.sh

# Clean up
bash clean.sh

# Clean all, including new repacked iso
bash clean.sh all
```
