# .bashrc

export SHELL=bash
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#xrdb -merge ~/.Xdefaults
umask 0002
export EDITOR=vi
#export VEPATH=~/bin
export PS1='[$HOSTNAME] $PWD> '
# Old PS1 --> ${PSPF}${PSD}$PSCH 
# Find ols pse by doing echo "$oldps1"

export P4PORT="tcp:eng0:1666"
export P4CONFIG=".p4settings"
export P4DIFF="tkdiff"
export P4EDITOR="vi"

export PRINTER="PCL6"

# Vim Tags
# export PATH="/usr/bin:$PATH"

myid=`id | sed -n -e 's/).*$//' -e 's/^.*(//p'`
if [ $myid = root ]
  then typeset -x PSCH='#'
  else typeset -x PSCH='>'
fi
export MYHOSTNAME=`uname -n | cut -f 1 -d.`
typeset PSPF="[$myid@$MYHOSTNAME] "
typeset PS1='${PSPF}${PSD}$PSCH '

alias cd=_cd;

    function _cd
        {
        \cd "$@" > /dev/null
        PSD="$(pwd|sed -e 's| .*||' -e 's|.*[^/]\(/[^/]*/[^/]*\)|..\1|')"
        }

# cd to PWD to set prompt
cd .

#PATH=$PATH:/projects/validation/tools/openocd/bin:/projects/validation/tools/gcc-arm-none-eabi-4_8-2015q1/bin:/projects/condor/bin:/opt/arm/DS-5/bin
export PATH=/opt/altera/quartus/19.3.0.222_Pro/quartus/bin:$PATH:/projects/validation/tools/openocd/bin:/projects/validation/tools/arm-gcc/bin:/projects/condor/bin:/opt/arm/DS-5/bin:/projects/validation/tools/Logic
# Path to MCU-project scripts for build flow
# Path to the ARM DS-5 compiler / linker tools
export QSYS_ROOTDIR="/opt/altera/quartus/19.1.0.240_Pro/qsys/bin"

source /projects/tools/bin/aliases.bash

if [[ `hostname` == *"eng"* ]]
then
#    eval `/usr/local/bin/envSetup /projects/shelby/share/data/envSetup.shelby.new`
#  eval `/usr/local/bin/envSetup -bash /projects2/corvette/share/data/envSetupData`
  eval `/usr/local/bin/envSetup -bash /projects2/falcon/share/data/envSetupData`
else
  export LD_LIBRARY_PATH=/usr/lib:/usr/lib/x86_64-linux-gnu:/projects/validation/tools/Logic:/opt/lsf/9.1/linux2.6-glibc2.3-x86_64/lib:/opt/cliosoft/sos_7.04.p12_linux64/lib/64bit:/opt/cliosoft/sos_7.04.p12_linux64/lib:/lib64:/opt/cadence/installs/GENUS/GENUS191/tools.lnx86/lib/64bit:/opt/rh/rh-python35/root/usr/lib64:/opt/altera/quartus_18.0/quartus/linux64/
fi
#eval `/usr/local/bin/envSetup /home/hravikumar/envSetup.shelby`

alias gdiff='git difftool'
alias pushq='git diff --stat --cached origin/master'

. /opt/lsf/conf/profile.lsf

#export AVERY_CDPHY=/opt/avery/cdsixactor-05.0.1107
#export AVERY_PLI=/opt/avery/avery_pli-2019_0915

#export PATH=$PATH:/opt/cadence/installs/INCISIV/INCISIV132_010/tools/bin
#export PATH=.:~/bin:~/tools/bin:/bin:/usr/bin:/usr/sbin:$PATH
#export LM_LICENSE_FILE=5280@eng0:27097@eng0
#export LM_LICENSE_FILE=5280@eng0:16342@eng0:8224@eng0:21541@eng0:5888@eng0:27020@eng0

export LM_LICENSE_FILE=1717@eng0:5280@eng0:16342@eng0:8224@eng0:21541@eng0:5888@eng0:27020@eng0:1700@eng0:/opt/license/license_files/ENG16_15_STRATIX10_FPGA_License.dat:/opt/license/license_files/ENG15_14_0_STRATIX10_FPGA_License:4071@eng0

# on systems which are VNC clients, do this:
# killall autocutsel
# autocutsel -fork

# -d for dirs
complete -d cd

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/quartus_18.0/quartus/linux64/

export QSYS_ROOTDIR=/home/hravikumar/quartus/quartus/sopc_builder/bin

source ~/.alias

# Custom shell commands
mcd () {
    mkdir -p "$1"
    cd "$1"
}

export PS1='\[\e[0;33m\]${PSPF}${PSD}$PSCH\[\e[0m\] '
