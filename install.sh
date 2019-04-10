#!/bin/sh

clear

osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
osascript -e "tell application \"Terminal\" to set background color of window 1 to {1028, 12850, 65535}"
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to {65535, 65535, 65535}"

clear 

loc=`locale | grep LANG | sed -e 's/.*LANG="\(.*\)_.*/\1/'`

            if [ ! $loc = "ru" ]; then
printf '\n\n*****   SpiraMira Hybrid Mode Patch for Mojave (10.14.1 - 10.14.4)   ******\n'
printf '*****                          Version 1.1                           ******\n'
                else
printf '\n\n*****   Патч гибридного режима интерфейса SpiraMira (10.14.1 - 10.14.4)   ******\n'
printf '*****                            Версия 1.1                               ******\n'
            fi

sleep 0.5

 if [ ! $loc = "ru" ]; then
printf '*****              Your system '
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '            ******\n\n\n'
                else
printf '*****                Ваша система '
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '              ******\n\n\n'
            fi

string=`sw_vers -productVersion` 
string=`echo ${string//[^0-9]/}`
string=${string:0:5}



if [ "$string" != "10141" ] && [ "$string" != "10142" ] && [  "$string" != "10143" ] && [  "$string" != "10144" ]; then
            if [ ! $loc = "ru" ]; then
    printf '\nThis program is for 10.14.1 - 10.14.4 (Mojave) only\n'
    printf '\n!!!! UNABLE TO CONTUNUE. BYE !!!!\n\n\n\n\n'
    read -p "Press any key to close this window " -n 1 -r
            else
    printf '\nЭта программа только для 10.14.1 - 10.14.4 (Mojave) \n'
    printf '\n!!!! ВЫПОЛНЕНИЕ НЕВОЗМОЖНО. ВЫХОД !!!!\n\n\n\n\n'
    read -p "Для выхода нажмите любую клавишу" -n 1 -r
        fi
    osascript -e 'tell application "Terminal" to close first window' & exit

    exit
fi


if [ ! $loc = "ru" ]; then 
printf 'Checking internet conectivity\n'
                else 
printf 'Проверяем интернет соединение\n'
fi

if ping -c 1 google.com >> /dev/null 2>&1; then 
        net=1
    if [ ! $loc = "ru" ]; then 
    printf 'Internet conectivity check passed.\n'
                else 
    printf 'Доступ в интернет подтвержден.\n'
    fi
 else 
        net=0
        if [ ! $loc = "ru" ]; then 
    printf 'Internet conectivity check failed !!!\n'
    printf 'local versions of the patch files will be used\n'
    printf 'which may be obsolete\n'
                else 
    printf 'Интернет соединение недоступно !!!\n'
    printf '\nБудут использованы локальные версии файлов\n'
    printf 'Которые могут оказаться устаревшими\n'
    fi
fi

cd $(dirname $0)

if [ $net = 1 ]; then


mkdir -p HybridMode/$string 2>/dev/null

case "$string" in
"10141" ) bstring=18B75; zname="https://github.com/SpiraMira/HybridMode-Public/blob/master/files/18B75/patchedapps/Hybrid-18B75-v1.3.zip?raw=true";;
"10142" ) bstring=18C54; zname-"https://github.com/SpiraMira/HybridMode-Public/blob/master/files/18C54/patchedapps/HybridMode-185C4-v1.4.1.zip?raw=true";;
"10143" ) bstring=18D109; zname="https://github.com/SpiraMira/HybridMode-Public/blob/master/files/18D109/patchedapps/Hybrid-18D109-v1.4.2.zip?raw=true";;
"10144" ) bstring=18E226; zname="https://github.com/SpiraMira/HybridMode-Public/blob/master/files/18E226/patchedapps/Hybrid-18E226-v1.4.3.zip?raw=true";;
esac

            if [ ! $loc = "ru" ]; then 
    printf 'Downloading patched files from SpiraMira repository ...'
            else 
    printf 'Загрузка патченных файлов из репозитория SpiraMira  ...'
            fi

while :;do printf '.' ;sleep 0.4;done &
trap "kill $!" EXIT 
cd ./HybridMode/$string
curl -L -s -o Hybrid.zip $zname 2>/dev/null
unzip  -o -qq Hybrid*.zip 2>/dev/null
rm -f HIToolbox
rm -f CoreUI
rm Hybrid*.zip 2>/dev/null
mv CoreUI* CoreUI 2>/dev/null
mv HIToolbox* HIToolbox 2>/dev/null
cd ../../
kill $!
wait $! 2>/dev/null
trap " " EXIT

printf ' \n'

    if [ ! -f "HybridMode/$string/CoreUI" ] || [ ! -f "HybridMode/$string/HIToolbox" ]; then 
            if [ ! $loc = "ru" ]; then 
            net=0
    printf 'Downloading failed. Local files will be used. !!!\n'
            else 
    printf 'Загрузка не успешна. Используются локальные файлы. !!!\n'
            fi
        else
    if [ ! $loc = "ru" ]; then 
    printf 'Downloading successful.  !!!\n'
            else 
    printf 'Загрузка успешна. !!!\n'
            fi

    fi
fi

if [ $net = 0 ]; then 
unzip  -o -qq HybridMode.zip
fi
unzip  -o -qq Original.zip

SystemCoreUI=`md5 -q /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI`
SystemHIToolbox=`md5 -q /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox`
ModCoreUI=`md5 -q HybridMode/$string/CoreUI`
ModHIToolbox=`md5 -q HybridMode/$string/HiToolbox`



if [[ $SystemCoreUI = $ModCoreUI ]]; then 
   
    if [[ $SystemHIToolbox = $ModHIToolbox ]]; then
        if [ ! $loc = "ru" ]; then
        printf 'OK ! Hybrid mod patch has already done\n\n\n'
                else
        printf 'OK ! патч гибридного режима уже был сделан\n\n\n'
            fi
        if [ ! $loc = "ru" ]; then
read -p "Press any key to close this window " -n 1 -r
                else
read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi

    rm -R ./HybridMode
    rm -R ./Original
    rm -R -f ./__MACOSX

clear
osascript -e 'tell application "Terminal" to close first window' & exit
    fi
             
fi

frstat=0


if [[ ! $SystemCoreUI = $ModCoreUI ]]; then

                                if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                    fi
                me=`sudo whoami`
                frstat=1
                if [ -f "/System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back" ]; then
                sudo rm /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back
                fi
                sudo cp /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI.back
                sudo rm /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
                sudo cp HybridMode/$string/CoreUI /System/Library/PrivateFrameworks/CoreUI.framework/Versions/Current/
                sudo chmod 755 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
                sudo chown 0:0 /Volumes/OSX/S*/L*/PrivateFrameworks/CoreUI.framework/Versions/Current/CoreUI
                            if [ ! $loc = "ru" ]; then
                printf '\nOK ! CoreUI mod patch done\n'
                else
                printf '\nOK ! Патч CoreUI для гибридного режима сделан\n'
                
                            fi
fi

if [[ ! $SystemHIToolbox = $ModHIToolbox ]]; then

                                if [ ! "$me" = "root" ]; then
                                        if [ ! $loc = "ru" ]; then
                                printf 'To continue enter your mac user account password\n'
                                printf 'To escape press CTRL+Z keys\n\n'
                                                    else
                                printf 'Для продолжения введите пароль пользователя мак\n'
                                printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
                                         fi
                                fi
        if [ -f "/System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back" ]; then
        sudo rm /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back
        fi
        frstat=1
        sudo cp /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox.back
        sudo rm /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
        sudo cp HybridMode/$string/HiToolbox /System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/
        sudo chmod 755 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
        sudo chown 0:0 /Volumes/OSX/S*/L*/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Versions/Current/HIToolbox
                            if [ ! $loc = "ru" ]; then
                printf '\nOK ! HIToolbox mod patch done\n'
                else
                printf '\nOK ! Патч HIToolbox для гибридного режима сделан\n'
                            fi
fi

if [[ $frstat == 1 ]]
	then

            if [ ! $loc = "ru" ]; then
printf '\nupdate the system frameworks cache. It takes a few minutes\n'
printf '\nProcessing: '
                else
printf '\nОбновляем кэш системных сценариев. Это занимает несколько минут\n'
printf '\nВыполняется: '
            fi
sleep 1


while :;do printf '.';sleep 3;done &
trap "kill $!" EXIT 
 sudo update_dyld_shared_cache -debug -force -root / 2>/dev/null

kill $!
wait $! 2>/dev/null
trap " " EXIT

            if [ ! $loc = "ru" ]; then
printf '\n\nSystem Frameworks Cache Updated\n'
printf 'Reboot the system to apply the settings\n\n'
sleep 1
                else
printf '\n\nКэш системных сценариев обновлен\n'
printf 'Перезагрузите систему для применения изменений\n\n'
            fi
fi

    rm -R ./HybridMode
    rm -R ./Original
    rm -R -f ./__MACOSX

        if [ ! $loc = "ru" ]; then
read -p "Press any key to close this window " -n 1 -r
                else
read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi
clear
osascript -e 'tell application "Terminal" to close first window' & exit

exit

