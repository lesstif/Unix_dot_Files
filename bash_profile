### bash profile


################# Default App ######################################################################
if [ -x "/usr/bin/less" ];then
	## Pager Setting
	export PAGER='less';
	#export LESS='IcmQ'
	#export LESSCHARSET='latin1'
	#export LESSOPEN="lessopen.sh %s"
	#export LESSCLOSE="lessclose.sh %s %s"
fi;

if [ -x "/usr/local/bin/vim" ]; then
	export EDITOR=/usr/local/bin/vim;
	alias 'vi=/usr/local/bin/vim $*';
fi
if [ -x "/usr/bin/vim" ]; then
	export EDITOR=/usr/bin/vim;
	alias 'vi=/usr/bin/vim $*';
fi
################# End of Default App ######################################################################


### load any per-platform .extra.bashrc files.
## get OS Info
ARCH=$(uname -s)

## /usr/local/bin 에 vim 등이 있으면 Linux 가 아니라고 생각하고 PATH 에 넣기..
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/ccs/bin:${WORKSHOP_DIR}/bin:/sbin:/usr/sbin:/${JAVA_HOME}/bin:/usr/dt/bin/:/usr/openwin/bin:/usr/local/apache2/bin:${MYSQLDIR}/bin:$OSS_DIR/bin:${M2_HOME}/bin";

export OSS_DIR=/usr/local/ossasn1/asn1cpp/solaris-2.4-forte-6.trial/4.3.0/

## tomcat 실행 옵션, setenv.sh 에 설정하면 되므로 주석 처리
#export CATALINA_OPTS="-Xms128m -Xmx512m"

export JAVA_HOME=/usr/java
export ANT_HOME=/usr/local/ant
#export HUDSON_HOME=/usr/local/apache2/htdocs/hudson
export M2_HOME=/usr/local/maven
export MAVEN_OPTS="-Xmx512m"

export ACE_ROOT=/data3/lesstif/devel/ACE_wrappers_5.3.6/
export LD_RUN_PATH=${ACE_ROOT}/ace

### Envrionment Var
export WORKSHOP_DIR=/opt/SUNWspro
export MYSQLDIR=/opt/mysql/mysql/
export HISTFILE=${HOME}/.history
export HISTFILESIZE=200
export HISTSIZE=200

alias 'deltree=rm -rf '
alias 'ant=${ANT_HOME}/bin/ant $*'
#alias 'rm=rm -i'
#alias 'ls=ls -N --color=tty'
if [ -x "/usr/local/bin/ls" ]; then
	alias ls='/usr/local/bin/ls --color=always --show-control-chars'
fi

#export PAGER='less -C -w -P"<Commands\: f = forward ; b = backward ; q = quit>"'
alias hps='hpscat -p -nh -nb -nf -nl $*'
alias 'tin=tin -r -q -n $*'
alias 'h2ps=nh2ps -1 -nd -p -ns -nL -nu -nH $*'  
alias 'slrnpull-get=slrnpull -d /var/spool'
alias  ci="ci -zLT $*"
alias  co="co -zLT $*"
export CADIR="/usr1/entrust/authdata/SubCA"
alias entenv="source ${CADIR}/env_settings.sh"
alias jsp='pushd /usr1/lesstif/jrun4/servers/default/default-ear/default-war'
alias vi=vim
alias curl='curl -C - -O $*'

#### Java Home Dir
export JAVALIB=${HOME}/javalib
#export PS1='\h:\w\$ '
## Color Prompt ~! :)
if [ x$TERM != x"dtterm" ];then
	export TERM=linux;
	export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H:\[\e[31;1m\]\w:> \[\e[0m\]" ;
else
	export PS1="\u@\w :"
fi

### export MANPATH=/usr/man:${WORKSHOP_DIR}/man:/usr/local/man:/usr/dt/man
#emacs () { EMACS=/usr/local/bin/emacs-20.2; 
#  if [ $TERM != "linux" ];then
#        eval "$EMACS -fn fontset-16 $* &";
#  else
#        eval $EMACS $*;
#fi; }	
lynx () {
	LYNX="/usr/local/bin/lynx"
	if [ $TERM != "sun" ];then
		OTERM=`echo $TERM`;
		export TERM=sun;
		${LYNX} $*;
		export TERM=${OTERM};
	else
		${LYNX} $*;
	fi;
}

#entsh () {
#	OLDPS=$PS1
#	PS1="\u@\w :"
#	export PS1
#	su Master1 <<EOF
#	. ${CADIR}/env_settings.sh
#	entsh
#	PS1=$OLDPS
#	export PS1
#EOF
#}
### Oracle for linux production version setting
## 
####export ORACLE_BASE=/oracle
####export ORACLE_SID=catest
export ORACLE_BASE=/ora9i/app/oracle
export ORACLE_HOME=${ORACLE_BASE}/product/920
export ORACLE_SID=TESTCA
export ORACLE_DOC=${ORACLE_HOME}/doc
export CLASSPATH=${ORACLE_HOME}/jdbc/lib/classes111.zip:$CLASSPATH
## SQL Net v2 Client status monitor in line mode.
## export ORA_CSM_MODE=line
## if using character set other than US7ASCII>
export ORA_NLS33=${ORACLE_HOME}/ocommon/nls/admin/data
#export NLS_LANG=AMERICAN_AMERICA.KO16KSC5601
export NLS_LANG=AMERICAN_AMERICA.KO16MSWIN949
export NLS_TERRITORY=korea
export PATH=${ORACLE_HOME}/bin:$PATH
export TNC_ADMIN=${ORACLE_HOME}/network/admin
#export NNTPSERVER=news.kornet.net

### QT setting
export QTDIR=/usr/local/Trolltech/Qt-4.4.3/
##export QTDIR=/data3/lesstif/src/qt-x11-commercial-src-4.4.3
export PATH=${PATH}:${QTDIR}/bin
export NFASTDIR=/opt/nfast
export OPENSSL_DIR=/usr/local/ssl/
export LD_LIBRARY_PATH=${QTDIR}/lib:${ORACLE_HOME}/lib32:/usr/local/lib:${NFASTDIR}/lib/:${NFASTDIR}/toolkits/pkcs11:${OPENSSL_DIR}/lib/:${ACE_ROOT}/ace:/opt/mysql/mysql/lib

##export CVSROOT=":pserver:lesstif@210.102.77.187:10020/usr1/cvs"
export PERL_READLINE_NOWARN=1

export RESIN_HOME=/export/home/novice/resin-2.0.5/

export LANG=ko_KR.UTF-8
#export LANG=ko
#export LANG=C

stty erase 

#pine() {
Pine() {
	export TERM=vt100;
	/usr/local/bin/pine
	export TERM=linux
}
Top() {
	export TERM=vt100;
	/usr/local/bin/top
	export TERM=linux
}

#.  Rational/purifyplus_setup.sh

##
export MAIN_LIB_DIR=${HOME}/devel/MagicPKI30/LIB
alias sol9='telnet 210.102.77.52'
alias dvcs='telnet 210.102.77.110'

alias redmine='cd /usr/local/apache2/htdocs/New_TradeSign/webapp/redmine/'
alias jsp='cd /usr/local/tomcat/work/Catalina/testca.tradesign.net/_/org/apache/jsp/'
## IAIK
#export CLASSPATH=${HOME}/iaik/iaikPkcs11Provider_demos.jar:${HOME}/iaik/iaikPkcs11Provider.jar:${HOME}/iaik/iaikPkcs11Wrapper.jar:${HOME}/iaik/iaik_jce.jar:$CLASSPATH

WINF=/usr/local/apache2/htdocs/WEB-INF/lib
WEB_JARS=$WINF/commons-dbcp-1.2.1.jar:$WINF/commons-dbutils-1.1.jar:$WINF/mysql-connector-java-5.0.4-bin.jar:$WINF/log4j-1.2.14.jar:$WINF/ojdbc14.jar:$WINF/struts-1.2.9.jar:$WINF/tradesign.jar:$WINF/jakarta-oro-2.0.8.jar:$WINF/activation.jar:$WINF/mail.jar:$WINF/j2ee.jar:$WINF/commons-httpclient-3.0.1.jar

## NCipher
export NFASTDIR=/opt/nfast/java/classes
export NFAST_JARS=${NFASTDIR}/nfjava.jar:${NFASTDIR}/kmjava.jar:${NFASTDIR}/kmcsp.jar:${NFASTDIR}/jutils.jar:${NFASTDIR}/keysafe.jar

## Luna
export LUNADIR=/usr/lunasa/jsp/lib/
export LUNA_JARS=${LUNADIR}/LunaJCASP.jar:${LUNADIR}/LunaJCESP.jar

export CLASSPATH=$LUNA_JARS:$WEB_JARS:${HOME}/java/bcprov-jdk14-134.jar:$CLASSPATH

## purifyplus 
if [ -x "/usr/local/PurifyPlus.7.0.1.Eval.Solaris_SPARC/purifyplus_setup.sh" ];then
	. /usr/local/PurifyPlus.7.0.1.Eval.Solaris_SPARC/purifyplus_setup.sh;
fi;

ccset () { 
	if [ -z "$1" ]
	then
		export WORKSHOP_DIR=/data1/SUNWspro
	else
		export WORKSHOP_DIR=/opt/SUNWspro
	fi
	echo "Setting WorkShop DIR=${WORKSHOP_DIR}"  # Or no parameter passed.

	export LANG=ko
	export MANPATH=/usr/man:${WORKSHOP_DIR}/man:/usr/local/man:/usr/dt/man
	export PATH="${WORKSHOP_DIR}/bin:$PATH"
}
