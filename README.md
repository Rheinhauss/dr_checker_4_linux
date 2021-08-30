# dr_checker_4_linux

Port to check Linux Kernel of "DR.CHECKER : A Soundy Vulnerability Detection Tool for Linux Kernel Drivers" (https://github.com/ucsb-seclab/dr_checker) also to newer Clang/LLVM (original was Clang/LLVM 3.8)


> Abstract
> 
> While kernel drivers have long been know to poses huge security risks, due to their privileged access and lower code quality, bug-finding tools for drivers are still greatly lacking both in quantity and effectiveness. This is because the pointer-heavy code in these drivers present some of the hardest challenges to static analysis, and their tight coupling with the hardware make dynamic analysis infeasible in most cases. In this work, we present DR. CHECKER, a soundy (i.e., mostly sound) bug-finding tool for Linux kernel drivers that is based on well-known program analysis techniques. We are able to overcome many of the inherent limitations of static analysis by scoping our analysis to only the most bug-prone parts of the kernel (i.e., the drivers), and by only sacrificing soundness in very few cases to ensure that our technique is both scalable and precise. DR. CHECKER is a fully-automated static analysis tool capable of performing general bug finding using both pointer and taint analyses that are flow-sensitive, context-sensitive, and fieldsensitive on kernel drivers. To demonstrate the scalability and efficacy of DR.CHECKER, we analyzed the drivers of nine production Linux kernels (3.1 million LOC), where it correctly identified 158 critical zero-day bugs with an overall precision of 78%.


Results for Linux 5.3.1

Results for Linux 5.13.9 (current stable are in progress)


# Setup

Tested on `Ubuntu 20.04`

Clone the repo.

Make sure you have Clang/LLVM 10 installed (newer Clang/LLVM will not work)

Ubuntu:

`apt install clang-10 sparse`

Make sure all the binaries have correct patsh i.e /usr/bin/llvm-link (linked to /usr/bin/llvm-link-10 etc), /usr/bin/opt (/usr/bin/opt-10) etc

Debug when needed.

No need to run `setup_drchecker.py`, you can skip it. For other instruction refer to original Dr. Checker repo.


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

Obviously, there are many results that need to be triaged. Feel free to send me kudos and/or DR.Checker team if you will get a CVE/vuln out of it.

