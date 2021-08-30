# dr_checker_4_linux

Port to check Linux Kernel of "DR.CHECKER : A Soundy Vulnerability Detection Tool for Linux Kernel Drivers" (https://github.com/ucsb-seclab/dr_checker) also to newer Clang/LLVM (original was Clang/LLVM 3.8)

Results for Linux 5.3.1

Results for Linux 5.13.9 (current stable are in progress)


# Setup

Clone the repo

Make sure you have Clang/LLVM 10 installed (newer Clang/LLVM will not work)

Ubuntu

`apt install clang-10`


No need to run `setup_drchecker.py`



Sample run

In Kernel source

```
make  CC=clang-10 HOSTCC=clang-10 allyesconfig
make V=1 CC=clang-10 HOSTCC=clang-10 > makeout.txt 2>&1
```

Then


```
python ../dr_checker/helper_scripts/runner_scripts/run_all.py -l /laptop/media/mk/4e3f0810-c5e8-4a7f-a629-2800a1356ebd/linux-5.3.1/bitout -a 5 -m /laptop/media/mk/4e3f0810-c5e8-4a7f-a629-2800a1356ebd/linux-5.3.1/makeout.txt -g clang-10 -n 2 -o /laptop/media/mk/4e3f0810-c5e8-4a7f-a629-2800a1356ebd/linux-5.3.1/ -k /laptop/media/mk/4e3f0810-c5e8-4a7f-a629-2800a1356ebd/linux-5.3.1/ -f /laptop/media/mk/4e3f0810-c5e8-4a7f-a629-2800a1356ebd/linux-5.3.1/result
```



# Results



5.3.1 results with code and filenames in `kernel-5.3.1/resultspp`


# Triage

Obiously there are many results that need to be triaged. Feel free to send me kudos and/or DR.Checker team if you will get a CVE/vuln out of it.











